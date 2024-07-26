// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "About",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6),
        .macOS(.v10_15)
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "About",
            targets: ["About"]),
    ],
    
    dependencies: [
        .package(url: "https://github.com/blue-triangle-tech/btt-swift-sdk.git", from: "3.9.1")
    ],
    
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "About",
            dependencies: [
                .product(name: "BlueTriangle", package: "btt-swift-sdk")
            ]),
        .testTarget(
            name: "AboutTests",
            dependencies: ["About"]),
    ]
)
