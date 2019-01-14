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


