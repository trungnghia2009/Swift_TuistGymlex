import ProjectDescription

private let bundleId: String = "com.nghiatran2023.ios.gymlex"
private let version: String = "0.0.1"
private let bundleVersion: String = "1"
private let iOSTargetVersion: String = "16.0"

private let basePath: String = "Targets/Gymlex"
private let appName: String = "Gymlex"

let project = Project(
    name: "Gymlex",
    settings: Settings.settings(configurations: makeConfigurations()),
    targets: [
        Target(
            name: "iOS",
            platform: .iOS,
            product: .app,
            bundleId: bundleId,
            deploymentTarget: .iOS(targetVersion: iOSTargetVersion, devices: .iphone),
            infoPlist: makeInfoPList(),
            sources: ["\(basePath)/Sources/**"],
            resources: ["\(basePath)/Resources/**"]
        )
    ],
    additionalFiles: [
        "README.md"
    ])

/// Create extended plist for iOS
/// - Returns: InfoPlist
private func makeInfoPList(merging other: [String: InfoPlist.Value] = [:]) -> InfoPlist {
    var extendedPlist: [String: InfoPlist.Value] = [
        "UIApplicationSceneManifest": ["UIApplicationSupportsMultipleScenes": true],
        "UILaunchScreen": [],
        "UISupportedInterfaceOrientations":
            [
                "UIInterfaceOrientationPortrait",
            ],
        "CFBundleShortVersionString": "\(version)",
        "CFBundleVersion": "\(bundleVersion)",
        "CFBundleDisplayName": "$(APP_DISPLAY_NAME)",
        "UILaunchStoryboardName": "LaunchScreen"
    ]

    other.forEach { (key: String, value: InfoPlist.Value) in
        extendedPlist[key] = value
    }

    return InfoPlist.extendingDefault(with: extendedPlist)
}

/// Create dev and release configuration
/// - Returns: Configuration Tuple
private func makeConfigurations() -> [Configuration] {
    let debug = Configuration.debug(name: "Debug", xcconfig: "Configs/Debug.xcconfig")
    let release = Configuration.release(name: "Release", xcconfig: "Configs/Release.xcconfig")
    return [debug, release]
}

private func baseSettings() -> Settings {
    // If something needs more than 10ms to compile Xcode will throw a warning! - This will help us to keep our build time low.
    let msThresholdForwWarnings: Int = 10
    let settings = SettingsDictionary().otherSwiftFlags(
        "-Xfrontend -warn-long-function-bodies=\(msThresholdForwWarnings)",
        "-Xfrontend -warn-long-expression-type-checking=\(msThresholdForwWarnings)"
    )
    return Settings.settings(base: settings,
                             configurations: [],
                             defaultSettings: .recommended)
}
