// swift-tools-version:4.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "pdfmerge",
    dependencies: [],
    targets: [
      .target(
        	name: "pdfmerge",
        	dependencies: ["pdfmergecore"]),
	.target(
		name: "pdfmergecore",
		dependencies: []),
      	.testTarget(
        	name: "pdfmergetest",
        	dependencies: ["pdfmergecore"])
    ]
)
