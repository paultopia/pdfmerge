import Foundation

public final class PDFMerger {
    private var arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) { 
        self.arguments = arguments
    }

    public func doMerge(files: [String], outfile: String, unsafe: Bool = false) throws {
        if fileExists(outfile) && !unsafe {
            throw PDFMergeError.targetFileExists(filename: outfile)
        } else if files.count == 1 {
            throw PDFMergeError.justOneInputFile
        } else {
        let merged = try mergePDFs(files: files)
        merged.write(toFile: outfile)
        print("Success! Merged \(files) into \(outfile)!")
        }
    }

    public func run() throws {
        let instructions = """
          Calling options:
          "pdfmerge outfile.pdf" -> merge every pdf file in directory in ABC order to outfile.pdf
          "pdfmerge infile1.pdf infile2.pdf infile3.pdf ... outfile.pdf" -> merges files in order given
          "pdfmerge infiles.txt outfile.pdf" -> merges files listed line-by-line in infiles.txt
          """
        let numargs = self.arguments.count
        let outfile = self.arguments.removeLast()

        switch numargs {
        case 1:
            print(instructions)
        case 2:
            if outfile == "GUI" {
                guard let infiles = selectFilesGUI()?.map({$0.path}) else {
                    throw PDFMergeError.noFilesChosen
                }
                guard let guiOut = setDestGUI()?.path else {
                    throw PDFMergeError.noDestinationChosen
                }
                try doMerge(files: infiles, outfile: guiOut)
            } else {
                try doMerge(files: listPDFsInCurrentDirectory(), outfile: outfile)
            }
        case 3:
            try doMerge(files: getListFromFile(self.arguments[1]), outfile: outfile)
        default:
            try doMerge(files: Array(self.arguments[1...]), outfile: outfile)
        }
    }
}
