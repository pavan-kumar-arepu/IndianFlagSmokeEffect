// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "IndianFlagSmokeEffect",
    platforms: [
        .iOS(.v14)
    ],
    products: [
        .library(
            name: "IndianFlagSmokeEffect",
            targets: ["IndianFlagSmokeEffect"]
        )
    ],
    targets: [
        .target(
            name: "IndianFlagSmokeEffect",
            dependencies: [],
            path: "Sources/IndianFlagSmokeEffect",
            exclude: [
                "ParticleImageGenerator.swift",
                "IndianFlagSmokeView.swift",
                "SmokeModalViewController.swift",
                "SmokeEffectPresenter.swift",
                "RootViewControllerAccessor.swift"
            ], publicHeadersPath: "include"
        )
    ]
)

