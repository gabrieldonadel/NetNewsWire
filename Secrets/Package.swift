// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "Secrets",
	platforms: [.macOS(SupportedPlatform.MacOSVersion.v10_15), .iOS(SupportedPlatform.IOSVersion.v14)],
    products: [
        .library(
            name: "Secrets",
			type: .dynamic,
            targets: ["Secrets"]
        )
    ],
    dependencies: [],
    targets: [
        .target(
            name: "Secrets",
            dependencies: []
        )
    ]
)
