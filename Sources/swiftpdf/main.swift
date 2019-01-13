import swiftpdfcore

let tool = PDFTool()

do {
    try tool.run()
} catch {
    print("Whoops! An error occurred: \(error)")
}

let pdffile1 = "page1.pdf"

let outfile = "pdfout.pdf"

copyData(infile: pdffile1, outfile: outfile)

// print("Hello, world!")
