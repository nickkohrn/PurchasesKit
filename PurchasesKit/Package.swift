// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PurchasesKit",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "PurchasesKit",
            targets: ["PurchasesKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture.git", .upToNextMajor(from: "0.0.0")),
        .package(url: "https://github.com/RevenueCat/purchases-ios.git", .upToNextMajor(from: "4.0.0")),
    ],
    targets: [
        .target(
            name: "PurchasesKit",
            dependencies: [
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
                .product(name: "RevenueCat", package: "purchases-ios"),
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "PurchasesKitTests",
            dependencies: ["PurchasesKit"]),
    ]
)
