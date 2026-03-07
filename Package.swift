// swift-tools-version: 5.9
import PackageDescription

let vlcFramework = Target.binaryTarget(name: "VLCKitFramework", url: "https://github.com/Moral-Apps/vlckit-ios/releases/download/3.7.3/VLCKit.xcframework.zip", checksum: "9a7206ce56250bf91cf43023dcfc31aac9bab61da1dbced2da018fa82ff85366")

let package = Package(
    name: "vlckit-ios",
    platforms: [
        .iOS(.v13),
        .tvOS(.v13),
        .macOS(.v11)
    ],
    products: [
        .library(
            name: "VLCKit",
            targets: ["VLCKit"]),
    ],
    dependencies: [],
    targets: [
        vlcFramework,
        .target(
            name: "VLCKit",
            dependencies: [
                .target(name: "VLCKitFramework")
            ]),
    ]
)