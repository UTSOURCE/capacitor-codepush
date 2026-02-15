// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CapCodepush",
    platforms: [.iOS(.v15)],
    products: [
        .library(
            name: "CapCodepush",
            targets: ["CodePushPlugin"])
    ],
    dependencies: [
        .package(url: "https://github.com/ionic-team/capacitor-swift-pm.git", exact: "8.1.0"),
        .package(url: "https://github.com/ZipArchive/ZipArchive.git", "2.4.0"..<"2.5.0")
    ],
    targets: [
        .target(
            name: "CodePushPlugin",
            dependencies: [
                .product(name: "Capacitor", package: "capacitor-swift-pm"),
                .product(name: "Cordova", package: "capacitor-swift-pm"),
                .product(name: "ZipArchive", package: "ZipArchive")
            ],
            path: "ios/Plugin",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("Base64"),
                .headerSearchPath("JWT/Core/Algorithms/Base"),
                .headerSearchPath("JWT/Core/Algorithms/ESFamily"),
                .headerSearchPath("JWT/Core/Algorithms/HSFamily"),
                .headerSearchPath("JWT/Core/Algorithms/RSFamily"),
                .headerSearchPath("JWT/Core/Algorithms/RSFamily/RSKeys"),
                .headerSearchPath("JWT/Core/Algorithms/Holders"),
                .headerSearchPath("JWT/Core/ClaimSet"),
                .headerSearchPath("JWT/Core/Coding"),
                .headerSearchPath("JWT/Core/FrameworkSupplement"),
                .headerSearchPath("JWT/Core/Supplement")
            ],
            linkerSettings: [
                .linkedFramework("UIKit")
            ]
        )
    ]
)
