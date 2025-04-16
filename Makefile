# Makefile for Neovim operations

prepare:
	mkdir -p _fennel

	if [ ! -d "_fennel/fennel-ls/.git" ]; then \
		echo "Cloning fennel-ls"; \
		git clone https://git.sr.ht/~xerool/fennel-ls _fennel/fennel-ls; \
	else \
		echo "Repository already exists. Skipping clone."; \
	fi
	@echo "Installing fennel-ls"
	cd _fennel/fennel-ls && make && sudo make install && cd -

	if [ ! -d "_fennel/fennel-fmt/.git" ]; then \
		echo "Cloning fennel-ls"; \
		git clone https://git.sr.ht/~technomancy/fnlfmt _fennel/fennel-fmt; \
	else \
		echo "Repository already exists. Skipping clone."; \
	fi
	@echo "Installing fennel-fmt"
	cd _fennel/fennel-fmt && make && sudo make install && cd -

	@echo "Installing docs"
	mkdir -p $$HOME/.local/share/fennel-ls/docsets/
	curl -o $$HOME/.local/share/fennel-ls/docsets/love2d.lua https://p.hagelb.org/docsets/love2d.lua
	curl -o $$HOME/.local/share/fennel-ls/docsets/nvim.lua https://git.sr.ht/~micampe/fennel-ls-nvim-docs/blob/main/nvim.lua
	
clean:
	rm -rf $$HOME/.local/share/nvim/
	rm -rf $$HOME/.local/state/nvim/
	rm -rf $$HOME/.cache/nvim/
