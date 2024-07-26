# Multiple private SPM Demo

This is a demo app for private SPM environment. In this kind of project structure, BlueTriangle SDK needs to be added as a dependency in each private Swift package where BlueTriangle SDK code needs to be used. In addition to private packages, BlueTriangle SDK needs to be added as a dependency in the App Project as well. Importantly, BlueTriangle SDK must be configured only once, possibly in the App.

To add BlueTriangle as a dependency to a private Swift package, refer to the code below in Package.swift

```swift
   
    ...
   
    dependencies: [
        .package(url: "https://github.com/blue-triangle-tech/btt-swift-sdk.git", from: "3.9.1")
    ],
    
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Intro",
            dependencies: [
                .product(name: "BlueTriangle", package: "btt-swift-sdk")
            ]),
        .testTarget(
            name: "IntroTests",
            dependencies: ["Intro"]),
    ]
 ```
    
for more details refer /PrivateSPMDemo/Intro/Package.swift

To add BlueTriangle SDK to main App and to integrate other feature follow help doc.

## Try Multiple private SPM Demo 

Find App Xcode project in PrivateSPMDemo/BTTMultiSPM. Open PrivateSPMDemo/BTTMultiSPM/BTTMultiSPM.xcodeproj will open demo app.

PrivateSPMDemo/About and  PrivateSPMDemo/Intro contains two private Swift packages (SPM). Which are using BlueTriangle SDK.
