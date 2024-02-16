// swift-tools-version:5.8
import PackageDescription

let package = Package(
    name: "Clarity",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "Clarity",
            targets: ["Clarity"]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "Clarity",
            url: "https://clarityappsresources.blob.core.windows.net/ios/Clarity-0.1.0.xcframework.zip?sp=r&st=2024-01-28T22:00:00Z&se=2024-05-01T00:00:00Z&spr=https&sv=2022-11-02&sr=c&sig=2EDZU20yOz%2BEa8sq%2B%2FjVBh43YivbKKH92Tpus5t9NF0%3D",
            checksum: "61fbddacd427ee60c8cf9855aace7edfccf6d9253498682de9c520a738580bee"
        ),
    ]
)
