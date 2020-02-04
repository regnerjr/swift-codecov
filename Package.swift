// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "swift-codecov",
    targets: [
        .target(
            name: "swift-codecov",
            dependencies: []),
        .testTarget(
            name: "swift-codecovTests",
            dependencies: ["swift-codecov"]),
    ]
)
