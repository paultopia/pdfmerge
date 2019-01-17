import Quartz
import Foundation
import Require

func fileExists(_ filename: String) -> Bool {
    let fileManager = FileManager()
    return fileManager.fileExists(atPath: filename)
}

func openPDF(_ file: String) -> PDFDocument {
    guard let pdata = try? NSData(contentsOfFile: file) as Data else {
        preconditionFailure("Cannot open \(file). It may not exist, or you may not have permissions for it.")
    }
    let pdf = PDFDocument(data: pdata)
        return pdf.require(hint: "Cannot open PDF file \(file). It may not exist, or not be a well-formed PDF file. Aborting.")
}

public func mergePDFs(files: [String]) -> PDFDocument {
    let first = files[0]
    let rest = files[1...]
    let pdf = openPDF(first)
    var curpagenum = pdf.pageCount
    var cur2add: PDFDocument
    var curpage: PDFPage
    var lenOfCurAdd: Int
    for p2add in rest {
        cur2add = openPDF(p2add)
        lenOfCurAdd = cur2add.pageCount
        for i in 0..<lenOfCurAdd {
            curpage = cur2add.page(at: i)!
            pdf.insert(curpage, at: curpagenum)
            curpagenum+=1
        }
    }
    return pdf
}

func listPDFsInCurrentDirectory() -> [String]{
    let fileManager = FileManager()
    let files = try? fileManager.contentsOfDirectory(atPath: ".")
    return files
      .require(hint: "Cannot open list of files to merge. Aborting.")
      .filter({ $0.hasSuffix(".pdf") }).sorted(by: <)
}

func getListFromFile(_ infile: String) -> [String]{
    let text = try? String(contentsOfFile: infile, encoding: .utf8)
    return text
      .require(hint: "Cannot rest list of files to merge. Is it a utf-8 encoded text file? It should be.")
      .split(separator: "\n").map(String.init) // because split returns an array of Substrings not of Strings annoyingly.
}
