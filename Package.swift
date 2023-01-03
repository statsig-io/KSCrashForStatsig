// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "KSCrashForStatsig",
    products: [
        .library(
            name: "KSCrashForStatsig",
            targets: [
                "KSCrashForStatsig/Empty",
            ]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "KSCrashForStatsig/Empty",
            path: "Source/Empty"
        )
    ],
    cxxLanguageStandard: .gnucxx11
)
