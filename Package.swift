// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "KSCrashForStatsig",
    products: [
        .library(
            name: "KSCrashForStatsig",
            targets: [
                "KSCrashForStatsig/Installations",
                "KSCrashForStatsig/Recording",
                "KSCrashForStatsig/Recording/Monitors",
                "KSCrashForStatsig/Recording/Tools",
                "KSCrashForStatsig/Reporting/Filters",
                "KSCrashForStatsig/Reporting/Filters/Tools",
                "KSCrashForStatsig/Reporting/Tools",
                "KSCrashForStatsig/Reporting/Sinks",
                "KSCrashForStatsig/swift/Basic"
            ]
        )
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "KSCrashForStatsig/Installations",
            path: "Source/KSCrash/Installations",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("../Recording"),
                .headerSearchPath("../Recording/Monitors"),
                .headerSearchPath("../Recording/Tools"),
                .headerSearchPath("../Reporting/Filters"),
                .headerSearchPath("../Reporting/Sinks"),
                .headerSearchPath("../Reporting/Tools"),
            ]
        ),
        .target(
            name: "KSCrashForStatsig/Recording",
            path: "Source/KSCrash/Recording",
            exclude: [
                "Monitors",
                "Tools"
            ],
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("Tools"),
                .headerSearchPath("Monitors"),
                .headerSearchPath("../Reporting/Filters")
            ]
        ),
        .target(
            name: "KSCrashForStatsig/Recording/Monitors",
            path: "Source/KSCrash/Recording/Monitors",
            publicHeadersPath: ".",
            cxxSettings: [
                .define("GCC_ENABLE_CPP_EXCEPTIONS", to: "YES"),
                .headerSearchPath(".."),
                .headerSearchPath("../Tools"),
                .headerSearchPath("../../Reporting/Filters")
            ]
        ),
        .target(
            name: "KSCrashForStatsig/Recording/Tools",
            path: "Source/KSCrash/Recording/Tools",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath(".."),
                .headerSearchPath("../../swift"),
                .headerSearchPath("../../swift/Basic"),
                .headerSearchPath("../../llvm/ADT"),
                .headerSearchPath("../../llvm/Support"),
                .headerSearchPath("../../llvm/Config")
            ]
        ),
        .target(
            name: "KSCrashForStatsig/Reporting/Filters",
            path: "Source/KSCrash/Reporting/Filters",
            exclude: [
                "Tools"
            ],
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("Tools"),
                .headerSearchPath("../../Recording"),
                .headerSearchPath("../../Recording/Monitors"),
                .headerSearchPath("../../Recording/Tools")
            ]
        ),
        .target(
            name: "KSCrashForStatsig/Reporting/Filters/Tools",
            path: "Source/KSCrash/Reporting/Filters/Tools",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("../../../Recording/Tools")
            ]
        ),
        .target(
            name: "KSCrashForStatsig/Reporting/Tools",
            path: "Source/KSCrash/Reporting/Tools",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("../../Recording"),
                .headerSearchPath("../../Recording/Tools")
            ]
        ),
        .target(
            name: "KSCrashForStatsig/Reporting/Sinks",
            path: "Source/KSCrash/Reporting/Sinks",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath("../Filters"),
                .headerSearchPath("../Filters/Tools"),
                .headerSearchPath("../Tools"),
                .headerSearchPath("../../Recording"),
                .headerSearchPath("../../Recording/Tools"),
                .headerSearchPath("../../Recording/Monitors")
            ]
        ),
        .target(
            name: "KSCrashForStatsig/swift/Basic",
            path: "Source/KSCrash/swift/Basic",
            publicHeadersPath: ".",
            cxxSettings: [
                .headerSearchPath(".."),
                .headerSearchPath("../../llvm/ADT"),
                .headerSearchPath("../../llvm/Config"),
                .headerSearchPath("../../llvm/Support")
            ]
        )
    ],
    cxxLanguageStandard: .gnucxx11
)
