import Foundation

public final class PDFMerger {
    private var arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) { 
        self.arguments = arguments
    }

    fileprivate func doMerge(files: [String], outfile: String){
        let merged = mergePDFs(files: files)
        merged.write(toFile: outfile)
    }

    fileprivate func fixSubstrings(_ ick: [Substring]) -> [String]{
        var outarray: [String] = []
        for i in ick {
            outarray.append(String(i))
        }
        return outarray
    }

    fileprivate func getListFromFile(_ infile: String) -> [String]{
        let text = try! String(contentsOfFile: infile, encoding: .utf8)
        let substrings = text.split(separator: "\n")
        return fixSubstrings(substrings)
    }

    public func run() {
        let instructions = """
          Calling options:
          "pdfmerge outfile.pdf" -> merge every pdf file in directory in ABC order to outfile.pdf
          "pdfmerge infile1.pdf infile2.pdf infile3.pdf ... outfile.pdf" -> merges files in order given
          "pdfmerge infiles.txt outfile.pdf" -> merges files listed line-by-line in infiles.txt
          """
        switch self.arguments.count {
        case 1,
             2:
            print(instructions)
        case 3:
            let outfile = self.arguments.removeLast()
            let files = getListFromFile(self.arguments[1])
            doMerge(files: files, outfile: outfile)
            print("done!")

        default:
            let outfile = self.arguments.removeLast()
            let files = Array(self.arguments[1...])
            doMerge(files: files, outfile: outfile)
            print("done!")
        }
    }
}
