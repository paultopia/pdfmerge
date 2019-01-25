import Quartz
import Foundation

func fileExists(_ filename: String) -> Bool {
    let fileManager = FileManager()
    return fileManager.fileExists(atPath: filename)
}


func openPDF(_ file: String) throws -> PDFDocument {
    guard let pdata = try? NSData(contentsOfFile: file) as Data else {
        throw PDFMergeError.cannotOpenFile(filename: file)
    }
    guard let pdf = PDFDocument(data: pdata) else {
        throw PDFMergeError.fileNotValidPDF(filename: file)
    }
        return pdf
}

public func mergePDFs(files: [String]) throws -> PDFDocument {
    let first = files[0]
    let rest = files[1...]
    let pdf = try openPDF(first)
    var curpagenum = pdf.pageCount
    var cur2add: PDFDocument
    var curpage: PDFPage
    var lenOfCurAdd: Int
    for p2add in rest {
        cur2add = try openPDF(p2add)
        lenOfCurAdd = cur2add.pageCount
        for i in 0..<lenOfCurAdd {
            curpage = cur2add.page(at: i)!
            pdf.insert(curpage, at: curpagenum)
            curpagenum+=1
        }
    }
    return pdf
}

func listPDFsInCurrentDirectory() throws -> [String] {
    let fileManager = FileManager()
    let files = try! fileManager.contentsOfDirectory(atPath: ".") // forcing this because there's no reasonable way it wouldn't be able to see the current working directory, absent some bizarre race with another process deleting it or something
    let pdfs = files.filter({ $0.hasSuffix(".pdf") }).sorted(by: <)
    if pdfs.count == 0 {
        throw PDFMergeError.noPDFFilesInDirectory
    } else {
        return pdfs
    }
}

func getListFromFile(_ file: String) throws -> [String] {
    guard let text = try? String(contentsOfFile: file, encoding: .utf8) else {
        throw PDFMergeError.cannotReadFileList(filename: file)
    }
    return text.split(separator: "\n").map(String.init) // because split returns an array of Substrings not of Strings annoyingly.
}
