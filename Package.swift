// swift-tools-version: 6.1
import PackageDescription

let checksumForAreebaIDV = "275c79907536addda665310f222442dada8588545c3863c4650e09b940a79207"

let idwiseSDKVersion = "5.5.2"


let package = Package(
    name: "AreebaIDVSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(
            name: "AreebaIDVSDK",
            targets: [ "AreebaIDVSDK"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/idwise/idwise-ios-sdk.git",exact:"5.5.2")
    ],
    targets: [
        .binaryTarget(
                   name: "AreebaIDV",
                   url: "https://docs.areeba.com/SDK/AreebaIDV.xcframework.zip",
                   checksum: checksumForAreebaIDV
               ),
        .target(
                   name: "AreebaIDVSDK",
                   dependencies: [
                       "AreebaIDV", // Binary Target
                       .product(name: "IDWise", package: "idwise-ios-sdk")
                       
                   ],
                   path: "Sources/AreebaIDVSDK"
               )
    ]
        
)
