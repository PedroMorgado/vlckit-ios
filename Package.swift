// swift-tools-version: 5.9
import PackageDescription

let vlcFramework = Target.binaryTarget(name: "VLCKitFramework", url: "https://github.com/Moral-Apps/vlckit-ios/releases/download/3.7.2/VLCKit.xcframework.zip", checksum: "6dbce53c57fe5fded314cf2d502fd1dcad84526c3199efdd554fbf385e409106")

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