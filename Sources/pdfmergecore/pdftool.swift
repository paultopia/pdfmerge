import Foundation

public final class PDFMerger {
    private var arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) { 
        self.arguments = arguments
    }

    fileprivate func doMerge(files: [String], outfile: String) {
        if fileExists(outfile) {
            preconditionFailure("Target file already exists. Aborting.")
        }
        else {
        let merged = mergePDFs(files: files)
        merged.write(toFile: outfile)
        print("Success! Merged \(files) into \(outfile)!")
        }
    }

    fileprivate func getListFromFile(_ infile: String) -> [String]{
        let text = try! String(contentsOfFile: infile, encoding: .utf8)
        return text.split(separator: "\n").map(String.init) // because split returns an array of Substrings not of Strings annoyingly.
    }

    public func run() {
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
            doMerge(files: listPDFsInCurrentDirectory(), outfile: outfile)
        case 3:
            doMerge(files: getListFromFile(self.arguments[1]), outfile: outfile)
        default:
            doMerge(files: Array(self.arguments[1...]), outfile: outfile)
        }
    }
}
