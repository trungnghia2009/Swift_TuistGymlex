// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Onboarding",
    platforms: [.iOS(.v16)],
    products: [
        .library(
            name: "Onboarding",
            targets: ["OnboardingUI"]),
    ],
    dependencies: [
        .package(name: "UIComponents", path: "../UIComponents")
    ],
    targets: [
        .target(
            name: "OnboardingUI",
            dependencies: [
                "UIComponents"
            ],
            resources: [
                .process("Resources/LottieFiles/coach.json")
            ]
        ),
        .testTarget(
            name: "OnboardingUITests",
            dependencies: ["OnboardingUI"]),
    ]
)
