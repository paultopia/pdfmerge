public enum PDFMergeError: Error {
    case targetFileExists(filename: String)
    case cannotOpenFile(filename: String)
    case fileNotValidPDF(filename: String)
    case cannotReadFileList(filename: String)
    case noFilesChosen
    case noDestinationChosen
    case justOneInputFile
}
