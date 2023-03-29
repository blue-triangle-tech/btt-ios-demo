# CocoaPods Example

A minimal demonstration of a project using the Blue Triangle SDK via [CocoaPods](https://cocoapods.org). Please note that the Swift Package Managert is the preferred installation method where possible.

## Getting Started

Install pods:

```
pod install
```

Create `DeveloperConfig.xcconfig` with the following contents at the repo's root directory to override the project development team and Blue Triangle site ID:

```
SITE_ID = <Your Site ID>
DEVELOPMENT_TEAM = <Your Team ID>
```
