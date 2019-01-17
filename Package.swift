// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pdfmerge",
    dependencies: [
	.package(url: "git@github.com:johnsundell/require.git", from: "1.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
      .target(
        	name: "pdfmerge",
        	dependencies: ["pdfmergecore"]),
	.target(
		name: "pdfmergecore",
		dependencies: ["Require"]),
      	.testTarget(
        	name: "pdfmergetest",
        	dependencies: ["pdfmergecore"])
    ]
)
