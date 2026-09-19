# URLFileDownloader

Download multiple files from a list of URLs quickly and automatically.

## Usage

1. Run the program once.
2. If `urls.txt` does not exist, the program will create it automatically.
3. Add your URLs to `urls.txt`, one URL per line.
4. Run the program again.
5. The downloaded files will be saved in the `downloads` folder, organized by hostname.

### Example

`urls.txt`:

```text
https://example.com/file.zip
https://example.org/image.png
```

The files will be saved like this:

```text
downloads/
├── example.com/
│   └── file.zip
└── example.org/
    └── image.png
```

## Run

```powershell
.\downloader.exe
```

If you want the console window to stay open after the program finishes:

```powershell
.\downloader.exe pause
```

## Compile

```powershell
nim c -d:release -d:ssl downloader.nim
```

## Requirements

* Windows
* [Nim](https://nim-lang.org/)
* SSL support (`-d:ssl` when compiling)
