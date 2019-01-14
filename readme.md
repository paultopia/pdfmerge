# pdgmerge

Small CLI to merge PDFs.  In Swift, so probably only works on Mac (might work on Linux?  Maybe?  Dunno.).

Calling options:

```
pdfmerge outfile.pdf
```

merge every pdf file in directory in ABC order to outfile.pdf

```
pdfmerge infile1.pdf infile2.pdf infile3.pdf ... outfile.pdf
```

merges files in the order given

```
pdfmerge infiles.txt outfile.pdf
```

merges files listed line-by-line in infiles.txt

Depending on the PDF files you use, it might warn you with `CoreGraphics PDF has logged an error. Set environment variabe "CG_PDF_VERBOSE" to learn more.` (including the typo!!). That error is probably safe to ignore: in my local development after setting that variable it turns out it's just some random font problem, probably pandoc/latex's fault. `WARNING: Type1 font data isn't in the correct format required by the Adobe Type 1 Font Format specification.`

This is just a learning project, plus because my [original pdf merging cli](https://github.com/paultopia/mergepdfs) seems to get the order wrong sometimes + has an annoying java dependency. 

