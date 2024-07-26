# Blue Triangle iOS Demo Applications

Demo apps for the [Blue Triangle SDK for iOS](https://github.com/blue-triangle-tech/btt-swift-sdk).

This repo contains the following demo apps:

- [CocoaPods](/CocoaPods/): A minimal UIKit app demonstrating usage of the SDK with CocoaPods](https://cocoapods.org)
- [Example-SwiftUI](/Example-SwiftUI/): A SwiftUI/UIKit app for interacting with a custom ecommerce API
- [TimerRequest](/TimerRequest/): A SwiftUI app for submitting custom timer requests to the Blue Triangle portal
- [PrivateSPMDemo](/PrivateSPMDemo/): A SwiftUI app demostrating uses of SDK in private swift packages (SPM) App structure

## Getting Started

Clone the repo:

```
git clone https://github.com/blue-triangle-tech/btt-ios-demo.git
```

Create `DeveloperConfig.xcconfig` with the following contents at the repo's root directory to override the project development team and Blue Triangle site ID:

```
SITE_ID = <Your Site ID>
DEVELOPMENT_TEAM = <Your Team ID>
```
