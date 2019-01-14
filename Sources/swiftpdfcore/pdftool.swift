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

    public func run() {
        switch self.arguments.count {
        case 1,
             2,
             3:
            print("syntax: swiftpdf file1.pdf file2.pdf... target.pdf")
        default:
            let outfile = self.arguments.removeLast()
            let files = Array(self.arguments[1...])
            doMerge(files: files, outfile: outfile)
            print("done!")
        }
    }
}
