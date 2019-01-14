import swiftpdfcore


let pdf1 = "page1.pdf"
let pdf2 = "page2.pdf"

let mergedfile = "merged.pdf"

let merged = mergeSinglePagePDFs(file1: pdf1, file2: pdf2)

try! merged.write(toFile: mergedfile)

// print(readPDF(infile: pdf1))

// let outfile = "pdfout.pdf"

// copyData(infile: pdf1, outfile: outfile)

// print("Hello, world!")
