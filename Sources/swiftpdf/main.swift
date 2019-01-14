import swiftpdfcore

let pdfs = ["page1.pdf", "long1.pdf", "long2.pdf", "page2.pdf"]
let mergedfile = "merged.pdf"
let merged = mergePDFs(files: pdfs)
merged.write(toFile: mergedfile)

// let long1 = "long1.pdf"
// let long2 = "long2.pdf"

// let mergedfile = "merged.pdf"

// let merged = mergeTwoLongPDFs(file1: long1, file2: long2)

// merged.write(toFile: mergedfile)


// let pdf1 = "page1.pdf"
// let pdf2 = "page2.pdf"

// let mergedfile = "merged.pdf"

// let merged = mergeSinglePagePDFs(file1: pdf1, file2: pdf2)

// merged.write(toFile: mergedfile)

// print(readPDF(infile: pdf1))

// let outfile = "pdfout.pdf"

// copyData(infile: pdf1, outfile: outfile)

// print("Hello, world!")
