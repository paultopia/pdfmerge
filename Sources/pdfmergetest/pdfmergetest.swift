import Foundation
import Quartz
import XCTest
import pdfmergecore

class PDFMergeCoreTests: XCTestCase {

    let shortstring = "Page 1\n\nPage 2\n\nPage 3\n\nPage 4\n"

    let longstring = "Page 1\n\nPage 2\n\nPage 3\n\nPage 4\n\nPage 5\n\nPage 6\n"

    let funkystring = "Page 1\n\nPage 2\n\nPage 5\n\nPage 6\n"

    let backwardstring = "Page 3\n\nPage 4\n\nPage 1\n\nPage 2\n"

    func helperReadPDF(_ filename: String) -> String {
        let pdata = try! NSData(contentsOfFile: filename) as Data
        let pdf = PDFDocument(data: pdata)
        return pdf!.string!
    }

    override class func setUp() {
        super.setUp()
        let filemanager = FileManager()
        filemanager.changeCurrentDirectoryPath("testpdfs")
    }

    func testOneArg() {
        let merger = PDFMerger(arguments: ["pdfmerge", "out.pdf"]) // since programs always gets name of executable as 0th arg
        merger.run()
        let output = helperReadPDF("out.pdf")
        XCTAssertTrue(output == shortstring)
    }

    func testTwoArgs() {
        let merger = PDFMerger(arguments: ["pdfmerge", "instructions.txt", "out.pdf"])
        merger.run()
        let output = helperReadPDF("out.pdf")
        XCTAssertTrue(output == backwardstring)
    }

    func testThreeAgs() {
        let merger = PDFMerger(arguments: ["pdfmerge", "a.pdf", "b.pdf", "out.pdf"])
        merger.run()
        let output = helperReadPDF("out.pdf")
        XCTAssertTrue(output == shortstring)
    }

    func testSubDirectories(){
        let merger = PDFMerger(arguments: ["pdfmerge", "a.pdf", "inner/c.pdf", "out.pdf"])
        merger.run()
        let output = helperReadPDF("out.pdf")
        XCTAssertTrue(output == funkystring)
    }

    func testMoreThanTwoPDFs(){
        let merger = PDFMerger(arguments: ["pdfmerge", "long_instructions.txt", "out.pdf"])
        merger.run()
        let output = helperReadPDF("out.pdf")
        XCTAssertTrue(output == longstring)
    }

    override func tearDown() {
        let filemanager = FileManager()
        try! filemanager.removeItem(atPath: "out.pdf")
        super.tearDown()
    }
}

