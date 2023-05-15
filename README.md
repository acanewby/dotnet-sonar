# dotnet-sonar

[![Docker Cloud Status](https://img.shields.io/docker/cloud/automated/nosinovacao/dotnet-sonar.svg)](https://hub.docker.com/r/intellicon/dotnet-sonar)
[![Docker Cloud Build Status](https://img.shields.io/docker/cloud/build/nosinovacao/dotnet-sonar.svg)](https://hub.docker.com/r/intellicon/dotnet-sonar)
[![Docker Pulls](https://img.shields.io/docker/pulls/nosinovacao/dotnet-sonar.svg)](https://hub.docker.com/r/intellicon/dotnet-sonar)

[![Docker Pulls](https://img.shields.io/docker/v/nosinovacao/dotnet-sonar?sort=semver)](https://github.com/acanewby/dotnet-sonar/releases/tag)
[![Docker Pulls](https://img.shields.io/docker/v/nosinovacao/dotnet-sonar?sort=date)](https://hub.docker.com/r/intellicon/dotnet-sonar/tags)

# Notes on this fork


Forked from the very excellent [nosinovacao/dotnet-sonar](https://github.com/nosinovacao/dotnet-sonar) to reintroduce the automated builds to Docker Hub 
that seem to have been discontinued in the original repository.

To make things easier for cutting/pasting example code, instances of `nosinovacao/dotnet-sonar` have been replaced with `intellicon/dotnet-sonar`.
This is ___in no way___ intended to plagiarize the hard work done by [@nosinovacao](https://github.com/nosinovacao).

_Warning:_ To allow for the widest possible range of out-of-the-box analysis capability, this image bundles a large number of .Net SDKs.
While this provides good compatibility, it does make the resulting image ___absolutely huge___ (~5GB).

Docker images available at [intellicon/dotnet-sonar](https://hub.docker.com/repository/docker/intellicon/dotnet-sonar)

## Tagging scheme in this repository

Since the primary goal is to access the bundled SonarScanner for .Net, our tags match the version of that component

[CHANGELOG](./CHANGELOG.md)


# Original repository commentary

_(with edits and enhancements)_

----
This is a container used to build dotnet projects and provide SonarQube analysis using SonarQube MSBuild Scanner.

It also allows you to run Docker in Docker using a `docker.sock` mount.

----

## Supported tags and respective `Dockerfile` links


> Tags are written using the following pattern: `dotnet-sonar:<year>.<month>.<revision>`

* `23.02.4`, `latest7`, `latest` [(23.02.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.02.4/Dockerfile)
  * DotNet 7.0.102
  * SonarScanner 5.11.0.60783
* `23.02.3`, `latest6` [(23.02.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/23.02.3/Dockerfile)
  * DotNet 6.0.405
  * SonarScanner 5.11.0.60783
> :warning: **[(THIS VERSION HAS REACHED END OF LIFE)](https://dotnet.microsoft.com/en-us/download/dotnet/5.0)**
* `22.07.1`, `latest5` [(22.07.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.07.1/Dockerfile)
  * DotNet 5.0.408
  * SonarScanner 5.7.1.49528
* `22.12.4` [(22.12.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.12.4/Dockerfile)
* `22.12.3` [(22.12.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.12.3/Dockerfile)
* `22.11.4` [(22.11.4/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.11.4/Dockerfile)
* `22.11.3` [(22.11.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.11.3/Dockerfile)
* `22.10.3` [(22.10.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.10.3/Dockerfile)
* `22.07.3` [(22.07.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.07.3/Dockerfile)
* `22.07.0`, `latest31` [(22.07.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/22.07.0/Dockerfile)
  * DotNetCore 3.1.420
  * SonarScanner 5.7.1.49528
* `21.11.3` [(21.11.3/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.11.3/Dockerfile)
* `21.11.1` [(21.11.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.11.1/Dockerfile)
* `21.11.0` [(21.11.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.11.0/Dockerfile)
* `21.07.1` [(21.07.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.07.1/Dockerfile)
* `21.07.0` [(21.07.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.07.0/Dockerfile)
* `21.06.1` [(21.06.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.06.1/Dockerfile)
* `21.06.0` [(21.06.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.06.0/Dockerfile)
* `21.05.1` [(21.05.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.05.1/Dockerfile)
* `21.05.0` [(21.05.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.05.0/Dockerfile)
* `21.04.1` [(21.04.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.04.1/Dockerfile)
* `21.04.0` [(21.04.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.04.0/Dockerfile)
* `21.01.1` [(21.01.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.01.1/Dockerfile)
* `21.01.0` [(21.01.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/21.01.0/Dockerfile)
* `20.12.2` [(20.12.2/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.12.2/Dockerfile)
* `20.12.1` [(20.12.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.12.1/Dockerfile)
* `20.12.0` [(20.12.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.12.0/Dockerfile)
  * DotNetCore 2.2.207
  * SonarScanner 5.0.4.24009
* `20.10.1` [(20.10.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.10.1/Dockerfile)
* `20.10.0` [(20.10.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.10.0/Dockerfile)
* `20.07.0` [(20.07.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/20.07.0/Dockerfile)
* `19.12.0` [(19.12.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/19.12.0/Dockerfile)
* `19.10.1` [(19.10.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/19.10.1/Dockerfile)
* `19.09.0` [(19.09-0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/19.09.0/Dockerfile)
* `19.08.0` [(19.08.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/19.08.0/Dockerfile)
* `19.01.0` [(19.01.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/19.01.0/Dockerfile)
* `18.12.1` [(18.12.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.12.1/Dockerfile)
* `18.09.0` [(18.09.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.09.0/Dockerfile)
* `18.07.0` [(18.07.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.07.0/Dockerfile)
* `18.05.0` [(18.05.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.05.0/Dockerfile)
* `18.03.1` [(18.03.1/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.03.1/Dockerfile)
* `18.03.0` [(18.03.0/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/18.03.0/Dockerfile)
* `2-4.0.2` [(2-4.0.2/Dockerfile)](https://github.com/nosinovacao/dotnet-sonar/blob/2-4.0.2/Dockerfile)

More info on docker hub: <https://hub.docker.com/r/nosinovacao/dotnet-sonar/>

## Compiling dotnet code with SonarQube Analysis

Full documentation: <https://docs.sonarqube.org/display/SCAN/Analyzing+with+SonarQube+Scanner+for+MSBuild>

### Inside container

```bash
$ dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin /k:sonarProjectKey /d:sonar.host.url="<SonarQubeServerUrl:Port>" /d:sonar.token="<SonarQubeServerToken>"
$ dotnet build
$ dotnet /sonar-scanner/SonarScanner.MSBuild.dll end  /d:sonar.token="<SonarQubeServerToken>"
```

### Outside container

Simple Usage:
```bash
$ docker run -it --rm -v <my-project-source-path>:/source intellicon/dotnet-sonar:latest bash -c "cd source \
    && dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin /k:sonarProjectKey /name:sonarProjectName /version:buildVersion \
    && dotnet restore \
    && dotnet build -c Release \
    && dotnet /sonar-scanner/SonarScanner.MSBuild.dll end"
```

Advanced Usage:

```bash
$ docker run -it --rm \
    -v <my-project-source-path>:/source \
    -v <my-nugetconfig-source-path>:/nuget \
    intellicon/dotnet-sonar:latest \
    bash -c \
        "cd source \
        && dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin \
        /k:<ProjectName> /name:<my-project-name> /version:<my-project-version> \
        /d:sonar.host.url="<my-sonar-server-url>" \
        /d:sonar.token="<my-sonar-server-token>" \
        /d:sonar.cs.opencover.reportsPaths='tests/**/coverage.opencover.xml' \
        && dotnet restore --configfile /nuget/NuGet.Config \
        && dotnet build -c Release \
        && dotnet publish -c Release -r linux-x64 -o deployment \
        && dotnet test --no-build -c Release --filter "Category=Unit" --logger trx --results-directory testResults /p:CollectCoverage=true /    p:CoverletOutputFormat=\"opencover\" \
        && dotnet /sonar-scanner/SonarScanner.MSBuild.dll end \
        /d:sonar.token="<my-sonar-server-token>""
```

The script above does the following:

* Mounts your project folder to the container's /source folder
* Mounts your nuget config to the container's /nuget folder (optional if no private nuget server is used)
* Begins the sonarscanner with the sonarqube server credentials
* Performs a dotnet restore with the nuget config in /nuget folder
* Executes the build command
* Publishes the build to the deployment folder
* Runs the tests and stores the test results in testResults folder. Change this command to your unit tests needs
* Ends the sonarscanner and publishes the sonarqube analysis results to the sonarqube server


### Directory management

_Note: In the `dotnet restore` and `dotnet build` steps above, you will need to provide an additional argument if your `.sln` file is not located in the folder from which you launch the analysis._

This is common when sources are located in a repository subdirectory:

```
   REPO_ROOT
      |
      |--CHANGELOG.md
      |--CODE_OF_CONDUCT.md
      |--CONTRIBUTING.md
      |--LICENSE
      |--README.md
      |--content
      |--src   << code to be analysed
      |--tools
```

You need to mount the repository at its root, so Sonarqube can detect the SCM provider from `.git` and similar files but then the solution build cannot be located:

```shell
root@7baace47320a:/source# dotnet restore
MSBUILD : error MSB1003: Specify a project or solution file. The current working directory does not contain a project or solution file.
```

The steps to success are:

1. Launch the container with your repository mounted at its root
   * `docker run -it --rm -v <local repository root>:/source intellicon/dotnet-sonar:latest { ...other arguments... }`
2. Pass the source subdirectory as an argument to `dotnet restore` and `dotnet build`:
   * `dotnet restore ./src`
   * `dotnet build ./src -c Release`




### Using Jenkins pipeline

The following pipeline code will:

* Start a sonar scanning session
* Build dotnet projects
* Run tests with coverage analysis (using coverlet) and publish them using the Jenkins XUnit publisher
* End a sonar scanning session
* [OPTIONAL] In the end, it waits for sonar's quality gate status and sets the build outcome

*Note that in order for coverage analysis to work, you need to add the coverlet NuGet package to the unit test project.*

```groovy
def envVariables = [
    'HOME=/tmp/home',
    'DOTNET_CLI_TELEMETRY_OPTOUT=1'
]

node('somenode-with-docker')
{
    withSonarQubeEnv('my-jenkins-configured-sonar-environment')
    {
        docker.image('intellicon/dotnet-sonar:latest').inside()
        {
            withEnv(envVariables)
            {
                stage('build')
                {
                    checkout scm
                    sh "dotnet /sonar-scanner/SonarScanner.MSBuild.dll begin /k:someKey /name:someName /version:someVersion /d:sonar.cs.opencover.reportsPaths='tests/**/coverage.opencover.xml'"
                    sh "dotnet build -c Release /property:Version=someVersion"
                    sh "rm -drf ${env.WORKSPACE}/testResults"
                    sh (returnStatus: true, script: "find tests/**/* -name \'*.csproj\' -print0 | xargs -L1 -0 -P 8 dotnet test --no-build -c Release --logger trx --results-directory ${env.WORKSPACE}/testResults /p:CollectCoverage=true /p:CoverletOutputFormat=opencover")
                    step([$class: 'XUnitPublisher', testTimeMargin: '3000', thresholdMode: 1, thresholds: [[$class: 'FailedThreshold', unstableThreshold: '0']
                            , [$class: 'SkippedThreshold']], tools: [[$class: 'MSTestJunitHudsonTestType', deleteOutputFiles: true, failIfNotNew: false
                            , pattern: 'testResults/**/*.trx', skipNoTestFiles: true, stopProcessingIfError: true]]])
                    sh "dotnet /sonar-scanner/SonarScanner.MSBuild.dll end"
                }
            }
        }
    }
}

timeout(time: 1, unit: 'HOURS')
{
    def qualityGate = waitForQualityGate()
    if (qualityGate.status == 'ERROR')
    {
        currentBuild.result = 'UNSTABLE'
    }
}
```

**If you want to use Docker in Docker**:

Please note that if you want to use Docker inside Docker (DinD) you need to perform additional actions when mounting the docker image in the pipeline.

**The following actions will expose your host to several security vulnerabilities** and therefore this should only be used when you absolutely must to:

```groovy
docker.image('intellicon/dotnet-sonar:latest').inside("--group-add docker -v /var/run/docker.sock:/var/run/docker.sock")
{
    // Some stuff
    docker.image.('hello-world:latest').inside()
    {
        sh "echo 'hello from docker inside docker'"
    }
}
```

The above code will:

* Add current jenkins user to the Docker group
* Mount the docker socket into the container so that you can control the Docker instance on the host machine

## Code Coverage

The above examples already implement the code-coverage analysis, **provided you add the coverlet NuGet package to your unit test project**.

If you want to know more, check: <https://dev.to/deinsoftware/net-core-unit-test-and-code-coverage-with-visual-studio-code-37bp>.

Also, coverlet documentation here: <https://github.com/tonerdo/coverlet/>.
