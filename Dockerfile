FROM mcr.microsoft.com/dotnet/sdk:7.0

# Dockerfile meta-information
LABEL maintainer="intellicon" \
    app_name="dotnet-sonar"

# Download URL sample for SonarScanner - https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/5.13.0.66756/sonar-scanner-msbuild-5.13.0.66756-net5.0.zip
# Choose SONAR_SCANNER_MSBUILD_VERSION and NETAPP_VERSION accordingly

ENV DOTNET_INSTALL_DIR=/usr/share/dotnet \
    SONAR_SCANNER_MSBUILD_VERSION=5.13.0.66756 \
    DOTNET_SDK_VERSION=7.0 \
    NETAPP_VERSION=net5.0 \
    OPENJDK_VERSION=11 \
    NODEJS_VERSION=16

# Do we need to specify versions?
#        DOCKER_VERSION=5:20.10.21~3-0~debian-bullseye \
#        CONTAINERD_VERSION=1.6.10-1 \


# Install .Net Core SDKs
RUN wget https://dot.net/v1/dotnet-install.sh -O dotnet-install.sh \
    && chmod +x ./dotnet-install.sh \
    && ./dotnet-install.sh --channel 2.0 \
    && ./dotnet-install.sh --channel 2.1 \
    && ./dotnet-install.sh --channel 2.2 \
    && ./dotnet-install.sh --channel 3.0 \
    && ./dotnet-install.sh --channel 3.1 \
    && ./dotnet-install.sh --channel 5.0 \
    && ./dotnet-install.sh --channel 6.0 \
    && ./dotnet-install.sh --channel 7.0


# Linux update
RUN apt-get update \
    && apt-get dist-upgrade -y \
    && apt-get install -y \
        apt-transport-https \
        ca-certificates \
        curl \
        gnupg-agent \
        lsb-release \
        software-properties-common

RUN mkdir -p /usr/share/man/man1mkdir -p /usr/share/man/man1

# Install Java
RUN apt-get install -y openjdk-$OPENJDK_VERSION-jre

# Install NodeJs
RUN wget https://deb.nodesource.com/setup_$NODEJS_VERSION.x \
    && bash setup_$NODEJS_VERSION.x \
    && apt-get install -y nodejs

# Install all necessary additional software
RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo \
        "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
        $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y \
        docker-ce \
        docker-ce-cli \
        containerd.io

# Install Sonar Scanner
RUN apt-get install -y unzip \
    && wget https://github.com/SonarSource/sonar-scanner-msbuild/releases/download/$SONAR_SCANNER_MSBUILD_VERSION/sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD_VERSION-$NETAPP_VERSION.zip \
    && unzip sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD_VERSION-$NETAPP_VERSION.zip -d /sonar-scanner \
    && rm sonar-scanner-msbuild-$SONAR_SCANNER_MSBUILD_VERSION-$NETAPP_VERSION.zip \
    && chmod +x -R /sonar-scanner




# Cleanup
RUN apt-get -q autoremove \
    && apt-get -q clean -y \
    && rm -rf /var/lib/apt/lists/* /var/cache/apt/*.bin
