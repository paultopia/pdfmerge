# pdfmerge

Small CLI to merge PDFs.  In Swift, so probably only works on Mac (might work on Linux?  Maybe?  Dunno.).

[![Build Status](https://travis-ci.com/paultopia/pdfmerge.svg?branch=master)](https://travis-ci.com/paultopia/pdfmerge)

<hr>
<hr>

## Usage

Calling options:

```
pdfmerge outfile.pdf
```

merge every pdf file in directory in ABC order by filename to outfile.pdf

<hr>

```
pdfmerge infile1.pdf infile2.pdf infile3.pdf ... outfile.pdf
```

merges files in the order given

<hr>

```
pdfmerge infiles.txt outfile.pdf
```

merges files listed line-by-line in infiles.txt

<hr>

Unsurprisingly, you can replace `outfile.pdf` with whatever you want, you can pass relative pathnames, and so forth.

In addition, there's a **special fancy grotesquely hacked-together GUI**: if you type: 

```
pdfmerge GUI
```

then you'll get a file picker window where you can command-select multiple files to merge (currently, you can only pick them in one go and it'll merge them in ABC order), and then another window to select a save location. 

Right now, it'll barf and refuse to put up with your instructions if you: 

- give it a bad (or nonexistent) PDF file to merge,

- tell it to merge just one file (why?!), or

- tell it to write to a file that already exists (just give it a new filename y'all). 

<hr>

<hr>

## Misc info

This is just a learning project, plus because my [original pdf merging cli](https://github.com/paultopia/mergepdfs) seems to get the order wrong sometimes + has an annoying java dependency. Mostly following instructions in [this excellent tutorial](https://www.swiftbysundell.com/posts/building-a-command-line-tool-using-the-swift-package-manager) for structuring the project. 

Now contains &#8734;% more tests!  

Depending on the PDF files you use, it might warn you with `CoreGraphics PDF has logged an error. Set environment variabe "CG_PDF_VERBOSE" to learn more.` (including the typo!!). That error is probably safe to ignore: in my local development after setting that variable it turns out it's just some random font problem, probably pandoc/latex's fault. `WARNING: Type1 font data isn't in the correct format required by the Adobe Type 1 Font Format specification.`

Also you'll probably get the following warning: `objc[1414]: Class FIFinderSyncExtensionHost is implemented in both /System/Library/PrivateFrameworks/FinderKit.framework/Versions/A/FinderKit (0x7fff87858210) and /System/Library/PrivateFrameworks/FileProvider.framework/OverrideBundles/FinderSyncCollaborationFileProviderOverride.bundle/Contents/MacOS/FinderSyncCollaborationFileProviderOverride (0x112919dc8). Oa.pdf` -- again, probably don't worry about it. This [appears to be a known OSX issue](https://github.com/sqweek/dialog/issues/24) and doesn't seem to be causing problems.

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
