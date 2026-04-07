# -------------------------------------------------------
# dotnet-sonar
# -------------------------------------------------------
# Single-stage build. A multi-stage approach was used previously to install
# .Net Core SDKs in a throwaway stage and COPY the results, but the savings
# were negligible (~30KB of install script) because the SDKs themselves are
# the bulk and must be copied in full regardless. The single-stage approach
# is simpler, allows shared ENV variables across all framework installations,
# and avoids the limitation that Mono (apt-installed across many directories)
# cannot be cleanly COPY'd between stages.
# -------------------------------------------------------
FROM mcr.microsoft.com/dotnet/sdk:10.0

ARG TARGETARCH

# Dockerfile meta-information
LABEL maintainer="intellicon" \
    app_name="dotnet-sonar"

# Download URL sample for SonarScanner - https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/6.2.0.85879/sonar-scanner-6.2.0.85879-net.zip
# Choose SONAR_SCANNER_MSBUILD_VERSION and NETAPP_VERSION accordingly

ENV DOTNET_INSTALL_DIR=/usr/share/dotnet \
    DOTNET_CORE_CHANNELS="5.0 6.0 7.0 8.0 9.0" \
    DOTNET_FX_TFMS="net40 net45 net451 net452 net46 net461 net462 net47 net471 net472 net48" \
    SONAR_SCANNER_MSBUILD_VERSION=11.2.1.137242 \
    NETAPP_VERSION=net \
    NODEJS_VERSION=22

# -------------------------------------------------------
# Prepare OS and supporting infrastructure
# -------------------------------------------------------

# Update Linux
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        lsb-release \
        software-properties-common \
    && mkdir -p /usr/share/man/man1

# Install libssl 1.1 (legacy)
# Older .Net SDKs (5.0, 6.0, etc.) were built against libssl1.1. The SDK 10
# base image moved from Debian to Ubuntu 22.04+, which ships libssl3 and no
# longer includes libssl1.1. Without this, those older SDKs fail on TLS calls.
RUN echo "Installing libssl 1.1 for $TARGETARCH" && \
    if [ "$TARGETARCH" = "amd64" ]; then \
      ARCHIVE="https://archive.ubuntu.com/ubuntu" && \
      LIBSSL="libssl1.1_1.1.1f-1ubuntu2.24_amd64.deb"; \
    elif [ "$TARGETARCH" = "arm64" ]; then \
      ARCHIVE="http://ports.ubuntu.com" && \
      LIBSSL="libssl1.1_1.1.1f-1ubuntu2.24_arm64.deb"; \
    else \
        echo "Unsupported architecture: $TARGETARCH"; \
    fi && \
    curl -O  $ARCHIVE/pool/main/o/openssl/$LIBSSL && \
    dpkg -i $LIBSSL && \
    apt-get install -f

# Install NodeJs and Docker
RUN wget https://deb.nodesource.com/setup_$NODEJS_VERSION.x \
    && bash setup_$NODEJS_VERSION.x \
    && apt-get install -y nodejs \
    && apt-get update \
    && apt-get install -y docker.io

# -------------------------------------------------------
# Install .Net Core SDKs
# -------------------------------------------------------
# The base image provides .Net 10; install older channels
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh \
    && chmod +x ./dotnet-install.sh \
    && for channel in $DOTNET_CORE_CHANNELS; do ./dotnet-install.sh --channel $channel; done \
    && rm ./dotnet-install.sh

# -------------------------------------------------------
# Install .Net Framework support (Mono + reference assemblies)
# -------------------------------------------------------

# Install Mono (.NET Framework runtime and MSBuild)
RUN apt-get update \
    && apt-get install -y --no-install-recommends mono-complete \
    && update-ca-certificates

# Enable Windows targeting and .NET Framework reference assemblies
RUN echo '<Project><PropertyGroup><EnableWindowsTargeting>true</EnableWindowsTargeting></PropertyGroup>' \
         '<ItemGroup><PackageReference Include="Microsoft.NETFramework.ReferenceAssemblies" Version="1.0.3" PrivateAssets="all" />' \
         '</ItemGroup></Project>' > /Directory.Build.props

# Install .NET Framework reference assemblies into the NuGet cache.
# This downloads the compile-time reference assemblies for each TFM so the
# image is self-contained — no network access needed at analysis time.
RUN for fw in $DOTNET_FX_TFMS; do \
        mkdir -p /tmp/warm-$fw \
        && echo "<Project Sdk=\"Microsoft.NET.Sdk\"><PropertyGroup><TargetFramework>$fw</TargetFramework></PropertyGroup></Project>" > /tmp/warm-$fw/warm.csproj \
        && if dotnet restore /tmp/warm-$fw/warm.csproj; then \
             echo "Installed $fw reference assemblies successfully"; \
           else \
             echo "WARNING: Failed to install $fw reference assemblies (will fall back to runtime download)"; \
           fi; \
    done \
    && rm -rf /tmp/warm-*

# -------------------------------------------------------
# Install Sonar Scanner
# -------------------------------------------------------
RUN apt-get install -y unzip \
    && wget https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/$SONAR_SCANNER_MSBUILD_VERSION/sonar-scanner-$SONAR_SCANNER_MSBUILD_VERSION-$NETAPP_VERSION.zip \
    && unzip sonar-scanner-$SONAR_SCANNER_MSBUILD_VERSION-$NETAPP_VERSION.zip -d /sonar-scanner \
    && rm sonar-scanner-$SONAR_SCANNER_MSBUILD_VERSION-$NETAPP_VERSION.zip \
    && chmod +x -R /sonar-scanner

# Cleanup
RUN apt-get -q autoremove \
    && apt-get -q clean -y \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*.bin
