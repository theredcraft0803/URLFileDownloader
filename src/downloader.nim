import std/[httpclient, os, strutils, uri]

proc main() =
    let inputFile = "urls.txt"
    let outputDir = "downloads"
    
    if not fileExists(inputFile):
        writeFile(inputFile, "")
        echo "Created urls.txt."
        echo "Please enter URLs and restart."
        return

    createDir(outputDir)
    
    let client = newHttpClient()
    
    for line in lines(inputFile):
        let url = line.strip()
        
        if url.len == 0 or url.startsWith("#"):
            continue
        
        echo ""
        echo "URL: ", url
        
        
        try:
            let parsed = parseUri(url)
            let host = parsed.hostname
            
            if host.len == 0:
                echo "  -> Invalid URL"
                continue
            
            let folder = outputDir / host
            createDir(folder)
            
            var fileName = extractFilename(parsed.path)
            
            if fileName.len == 0:
                fileName = "index.html"
                
            let target = folder / fileName
                
            echo "  -> Download to: ", target
                
            client.downloadFile(url, target)
                
            if fileExists(target):
                echo "  -> Succesfully downloaded!"
            else:
                echo "  -> File was not created!"
        except CatchableError as e:
            echo "  -> ERROR: ", e.msg
    client.close()

main()
