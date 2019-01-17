import Quartz
import Foundation

func fileExists(_ filename: String) -> Bool {
    let fileManager = FileManager()
    return fileManager.fileExists(atPath: filename)
}


func openPDF(_ file: String) throws -> PDFDocument {
    try {
        let pdata = NSData(contentsOfFile: file) as Data 
    } catch {
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
    let files = try! fileManager.contentsOfDirectory(atPath: ".") // forcing this because there's no reasonable way it wouldn't be able to see the current working directory, absent some bizarre race with another process deleting it or something
    return files.filter({ $0.hasSuffix(".pdf") }).sorted(by: <)
}

func getListFromFile(_ file: String) throws -> [String]{
    try { 
        let text = String(contentsOfFile: file, encoding: .utf8)} 
    catch {
        throw PDFMergeError.cannotReadFileList(filename: file)
    }
    return text.split(separator: "\n").map(String.init) // because split returns an array of Substrings not of Strings annoyingly.
}
