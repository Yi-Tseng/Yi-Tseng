.PHONY: pdf clean help

# Default target
help:
	@echo "Available targets:"
	@echo "  make pdf    - Convert resume.md to resume.pdf"
	@echo "  make clean  - Remove generated PDF file"

# Convert markdown to PDF using pandoc
pdf: resume.md
	@command -v pandoc >/dev/null 2>&1 || { echo >&2 "Error: pandoc is required but not installed. Install it with: brew install pandoc"; exit 1; }
	@export PATH="/Library/TeX/texbin:$$PATH"; \
	command -v xelatex >/dev/null 2>&1 || { \
		echo >&2 "Error: xelatex not found."; \
		echo >&2 ""; \
		echo >&2 "If you just installed basictex, try one of these solutions:"; \
		echo >&2 "  1. Restart your terminal and run 'make pdf' again"; \
		echo >&2 "  2. Run: eval \$$(brew --prefix)/bin/brew shellenv"; \
		echo >&2 "  3. Run: export PATH=\"/Library/TeX/texbin:\$$PATH\" && make pdf"; \
		echo >&2 ""; \
		echo >&2 "If basictex is not installed, run: brew install --cask basictex"; \
		exit 1; \
	}; \
	pandoc resume.md -o resume.pdf \
		--pdf-engine=xelatex \
		-V geometry:margin=1in \
		-V fontsize=11pt \
		-V colorlinks=true \
		-V linkcolor=blue \
		-V urlcolor=blue
	@echo "✓ PDF generated successfully: resume.pdf"

# Clean generated files
clean:
	rm -f resume.pdf
	@echo "✓ Cleaned generated files"
