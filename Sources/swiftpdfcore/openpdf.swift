import Quartz
import Foundation


public func copyData(infile: String, outfile: String) {
    let pdf = NSData(contentsOfFile: infile)
    try! pdf!.write(toFile: outfile)
    // apparently, and contrary to the docs,
    // the NSData initializer returns an optional, and the write function throws.
    }

public func readPDF(infile: String) -> String {
    let pdata = try! NSData(contentsOfFile: infile) as Data
    // but it DOES throw when you try to force cast it with as.  special...
    let pdf = PDFDocument(data: pdata)
    return pdf!.string!
}

public func mergeSinglePagePDFs(file1: String, file2: String) -> PDFDocument {
    let pdata1 = try! NSData(contentsOfFile: file1) as Data
    let pdata2 = try! NSData(contentsOfFile: file2) as Data
    let pdf1 = PDFDocument(data: pdata1)
    let pdf2 = PDFDocument(data: pdata2)
    print(pdf1!.pageCount)
    let page2 = pdf2!.page(at: 0)
    pdf1!.insert(page2!, at: 1)
    return pdf1!
}
