import pdfmergecore

// "Cannot open \(filename). It may not exist, or you may not have permissions for it."
// "Cannot rest list of files to merge. Is it a utf-8 encoded text file? It should be."
// 


case targetFileExists(filename: String)
    case cannotOpenFile(filename: String)
    case fileNotValidPDF(filename: String)
    case cannotReadFileList(filename: String)

let merger = PDFMerger()

do {
    try merger.run()
    } catch PDFMergeError.targetFileExists(let filename) {
        print("Target file \(filename) already exists. Aborting.")
    } catch PDFMergeError.cannotOpenFile(let filename) {
        print("Cannot open file \(filename). It may not exist, or you may not have permissions for it. Aborting.")
    } catch PDFMergeError.fileNotValidPDF(let filename) {
        print("File \(filename) does not appear to be a valid PDF. Aborting.")
    } catch PDFMergeError.cannotReadFileList(let filename) {
        print("Cannot rest list of files to merge in \(filename). Is it a utf-8 encoded text file? It should be. Aborting")
    }
    