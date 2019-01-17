import pdfmergecore

\\ "Cannot open \(file). It may not exist, or you may not have permissions for it."
\\ "Cannot rest list of files to merge. Is it a utf-8 encoded text file? It should be."
\\ "Target file already exists. Aborting."


let merger = PDFMerger()

do {
    try merger.run()
    }
catch is PDFMergeError {
    print("errored, aborted")
    }
