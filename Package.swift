// swift-tools-version: 5.8

import PackageDescription

let package = Package(
    name: "YYText",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "YYText", targets: ["YYText"])
    ],
    targets: [
        // 公开头文件分在多个子目录，include/YYText 下放的是指向它们的软链接，
        // 这样 SPM 会以 YYText/YYText.h 作为 umbrella header，<YYText/xxx.h> 的写法也能找到
        .target(name: "YYText",
                path: "YYText",
                publicHeadersPath: "include",
                cSettings: [
                    .headerSearchPath("."),
                    .headerSearchPath("Component"),
                    .headerSearchPath("String"),
                    .headerSearchPath("Utility"),
                ],
                linkerSettings: [
                    .linkedFramework("UIKit"),
                    .linkedFramework("CoreFoundation"),
                    .linkedFramework("CoreText"),
                    .linkedFramework("QuartzCore"),
                    .linkedFramework("Accelerate"),
                    .linkedFramework("MobileCoreServices"),
                ]),
    ]
)
