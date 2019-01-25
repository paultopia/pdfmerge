import AppKit


func selectFilesGUI() -> [URL]? {
    let dialog = NSOpenPanel()
    dialog.allowedFileTypes = ["pdf"]
    dialog.allowsMultipleSelection = true
    guard dialog.runModal() == .OK else { return nil }
    return dialog.urls
}


func setDestGUI() -> URL? {
    let dialog = NSSavePanel()
    dialog.nameFieldStringValue = "merged_files.pdf"
    dialog.canCreateDirectories = true
    dialog.allowedFileTypes = ["pdf"]
    guard dialog.runModal() == .OK else { return nil }
    return dialog.url
}
