# swiftpdf

learning package

currently can merge arbitrary number of PDFs.

Calling options:

```
          "pdfmerge outfile.pdf" -> merge every pdf file in directory in ABC order to outfile.pdf
          "pdfmerge infile1.pdf infile2.pdf infile3.pdf ... outfile.pdf" -> merges files in order given
          "pdfmerge infiles.txt outfile.pdf" -> merges files listed line-by-line in infiles.txt
```

It throws an error and declares `CoreGraphics PDF has logged an error. Set environment variabe "CG_PDF_VERBOSE" to learn more.` (including the typo!!) but after setting that variable it turns out it's just some random font problem, probably pandoc/latex's fault. `WARNING: Type1 font data isn't in the correct format required by the Adobe Type 1 Font Format specification.`






 description of this package.


trying to figure out how to work swift 

largely following this tutorial for command line apps: https://www.swiftbysundell.com/posts/building-a-command-line-tool-using-the-swift-package-manager 

