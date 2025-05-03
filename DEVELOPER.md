# Build and release mechanics

## Develop and test

1. GitFlow->Start Feature
   * Use the semantic number version of the MSBuild component (x.y.z)
2. Make required changes
   * Dockerfile
   * CHANGELOG.md
      * versions number
      * key changes
      * Date is UNRELEASED
3. Test locally
   * `docker build -t dotnet-sonar:x.y.z .`
4. GitFlow->Finish Feature
 
## Release

7. GitFlow->Start Release
   * Use the semantic number version of the MSBuild component (x.y.z)
   * Update CHANGELOG.md
      * Set Date to actual release date
6. GitFlow->Finish Release
7. Push to Docker Hub
   * Observe and [verify build](https://hub.docker.com/repository/registry-1.docker.io/intellicon/dotnet-sonar/builds)
8. On `develop` branch
   * Add `x.x.x (UNRELEASED)` placeholder


