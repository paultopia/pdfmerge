# pdfmerge

Small CLI to merge PDFs.  In Swift, so probably only works on Mac (might work on Linux?  Maybe?  Dunno.).

[![Build Status](https://travis-ci.com/paultopia/pdfmerge.svg?branch=master)](https://travis-ci.com/paultopia/pdfmerge)

## Usage

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

<hr>

## Misc info

This is just a learning project, plus because my [original pdf merging cli](https://github.com/paultopia/mergepdfs) seems to get the order wrong sometimes + has an annoying java dependency. Mostly following instructions in [this excellent tutorial](https://www.swiftbysundell.com/posts/building-a-command-line-tool-using-the-swift-package-manager) for structuring the project. 

Now contains &#8734;% more tests!  (Only of the happy path though.)

Depending on the PDF files you use, it might warn you with `CoreGraphics PDF has logged an error. Set environment variabe "CG_PDF_VERBOSE" to learn more.` (including the typo!!). That error is probably safe to ignore: in my local development after setting that variable it turns out it's just some random font problem, probably pandoc/latex's fault. `WARNING: Type1 font data isn't in the correct format required by the Adobe Type 1 Font Format specification.`

Apparently Swift doesn't let you test precondition failures without horrible hacks?  (See [this article](http://www.cocoawithlove.com/blog/2016/02/02/partial-functions-part-two-catching-precondition-failures.html).  This strikes me as a massive wart for code that takes user input; I might rewrite this in some fashion to return nil and propagate errors up to the entry point and such down the road to deal with that, but this seems time-consuming, so, for now, I *think* that, if you give it a bad PDF file, it'll just crash, and if you give it a nonexistent file to merge, it'll crash, and if you tell it to write to a file that already exists it will crash, but I have no tests to confirm that. 

Working binary in releases tab; code may be a little bit ahead but functionality won't be different, I'll release on every functional change.

All code released under the WTFPL, included below:

<hr>

[DO WHAT(ever) THE FUCK YOU WANT TO PUBLIC LICENSE](http://www.wtfpl.net/) 

Version 2, December 2004 

Code (C) 2019 Paul Gowder <paul.gowder@gmail.com>

License text copyright (C) 2004 Sam Hocevar <sam@hocevar.net> 

Everyone is permitted to copy and distribute verbatim or modified 
copies of this license document [and code], and changing it is allowed as long 
as the name is changed. 

DO WHAT THE FUCK YOU WANT TO PUBLIC LICENSE 

TERMS AND CONDITIONS FOR COPYING, DISTRIBUTION AND MODIFICATION 

0. You just DO WHAT THE FUCK YOU WANT TO.
