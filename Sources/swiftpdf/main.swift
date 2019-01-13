import swiftpdfcore

let tool = PDFTool()

do {
    try tool.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}

// print("Hello, world!")
