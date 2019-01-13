import Quartz
import Foundation


public func copyData(infile: String, outfile: String) {
    let pdf = NSData(contentsOfFile: infile)
    try! pdf!.write(toFile: outfile)
    // apparently, and contrary to the docs,
    // the NSData initializer returns an optional, and the write function throws.
    }

public func readPDF(infile: String) -> String {
    let pdata = NSData(contentsOfFile: infile)
    let pdf = PDFDocument(data: pdata)
    return pdf!.string!
}


