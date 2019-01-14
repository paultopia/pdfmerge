import Quartz
import Foundation

func fileExists(_ filename: String) -> Bool {
    let fileManager = FileManager()
    return fileManager.fileExists(atPath: filename)
}

func openPDF(_ file: String) -> PDFDocument {
    if fileExists(file){
        let pdata = try! NSData(contentsOfFile: file) as Data
        let pdf = PDFDocument(data: pdata)
        return pdf!
    }
    else {
        print("Unable to find file \(file), aborting.")
        exit(1)
    }
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
    let files = try! fileManager.contentsOfDirectory(atPath: ".")
    let pdfs = files.filter { $0.hasSuffix(".pdf") }
    return pdfs.sorted(by: <)
}

