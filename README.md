# swiftpdf

learning package

currently can merge arbitrary number of PDFs.

It throws an error and declares `CoreGraphics PDF has logged an error. Set environment variabe "CG_PDF_VERBOSE" to learn more.` (including the typo!!) but after setting that variable it turns out it's just some random font problem, probably pandoc/latex's fault. `WARNING: Type1 font data isn't in the correct format required by the Adobe Type 1 Font Format specification.`






 description of this package.


trying to figure out how to work swift 

largely following this tutorial for command line apps: https://www.swiftbysundell.com/posts/building-a-command-line-tool-using-the-swift-package-manager 

plus trying to get commandline pdf merging with code from here: https://stackoverflow.com/questions/37133031/function-in-swift-to-append-a-pdf-file-to-another-pdf

oh wait, that's ios.  maybe https://developer.apple.com/documentation/pdfkit 

which is apparently in a framework called quartz, though wouldn't it be nice if it said that... https://stackoverflow.com/questions/40481769/nsimages-to-pdfs-and-merge-them-in-swift

see also http://sketchytech.blogspot.com/2015/05/adventures-in-pdf-swift-and-pdfkit.html

https://equaleyes.com/blog/2018/02/02/introducing-pdfkit-the-right-way-to-treat-your-pdfs-on-ios/

https://stackoverflow.com/questions/40481769/nsimages-to-pdfs-and-merge-them-in-swift

and let's see if things work.
