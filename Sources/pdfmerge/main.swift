import AppKit
NSApplication.shared.setActivationPolicy(.accessory)

import pdfmergecore


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
        print("Cannot read list of files to merge in \(filename). Is it a utf-8 encoded text file? It should be. Aborting")
} catch PDFMergeError.noFilesChosen {
    print("No files chosen! Operation canceled.")
} catch PDFMergeError.noDestinationChosen {
    print("No destination file chosen! Operation canceled.")
} catch PDFMergeError.justOneInputFile {
    print("It really makes no sense to just to merge just one PDF. Aborting.")
} catch PDFMergeError.noPDFFilesInDirectory {
    print("No PDF files to merge in current directory.")
}
