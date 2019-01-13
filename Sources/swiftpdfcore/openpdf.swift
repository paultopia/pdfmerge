import Quartz
import Foundation


public func copyData(infile: String, outfile: String) {
    let pdf = NSData(contentsOfFile: infile)
    try! pdf!.write(toFile: outfile)
    }




