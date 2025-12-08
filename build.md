# Resume

This repository contains my professional resume in Markdown format with tools to generate a PDF version.

## Prerequisites

To generate the PDF, you need to install:

1. **pandoc** - Document converter
2. **basictex** - LaTeX distribution for PDF generation

### Installation (macOS)

```bash
brew install pandoc
brew install --cask basictex
```

**After installing basictex, restart your terminal** to ensure the TeX binaries are in your PATH.

### Installation (Linux)

```bash
# Ubuntu/Debian
sudo apt-get install pandoc texlive-xetex

# Fedora
sudo dnf install pandoc texlive-xetex
```

## Usage

### Generate PDF

Convert the markdown resume to PDF:

```bash
make pdf
```

This will create `resume.pdf` with the following formatting:
- 1-inch margins
- 11pt font size
- Clickable hyperlinks (blue)
- Professional layout using XeLaTeX

### Clean Generated Files

Remove the generated PDF:

```bash
make clean
```

### Help

Display available commands:

```bash
make help
```

## Files

- `resume.md` - Source resume in Markdown format
- `Makefile` - Build script for PDF generation
- `resume.pdf` - Generated PDF (not tracked in git)

## Customization

To customize the PDF output, edit the pandoc options in the [Makefile](Makefile):

- `-V geometry:margin=1in` - Adjust margins
- `-V fontsize=11pt` - Change font size
- `-V colorlinks=true` - Enable/disable colored links
- `--pdf-engine=xelatex` - Switch PDF engine (pdflatex, lualatex, etc.)

## Troubleshooting

### "xelatex not found" error on macOS

If you get this error after installing basictex, try these solutions:

**First, check if basictex is fully installed:**

If `/Library/TeX/texbin` doesn't exist, basictex wasn't fully installed. Reinstall it:
```bash
brew reinstall --cask basictex
# Enter your password when prompted
# Then restart your terminal
```

**If basictex is installed but not in PATH:**

**Option 1: Restart your terminal (Recommended)**
```bash
# Close and reopen your terminal, then run:
make pdf
```

**Option 2: Add TeX to PATH for current session**
```bash
export PATH="/Library/TeX/texbin:$PATH"
make pdf
```

**Option 3: Add to shell profile permanently**

For **zsh** (default on macOS):
```bash
echo 'export PATH="/Library/TeX/texbin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

For **bash**:
```bash
echo 'export PATH="/Library/TeX/texbin:$PATH"' >> ~/.bash_profile
source ~/.bash_profile
```
