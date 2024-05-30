[{1 :nvim-treesitter/nvim-treesitter
    :build ":TSUpdate"
    :config (fn [_ opts]
	      (tset (require :nvim-treesitter.install) :prefer_git true)
	      ((. (require :nvim-treesitter.configs) :setup) opts))
    :opts {:auto_install true
    :ensure_installed [:bash
			:c
			:html
			:lua
			:dockerfile
			:make
			:tmux
			:luadoc
			:markdown
			:vim
			:vimdoc
			:go
			:javascript
			:typescript
			:python
			:fennel
			:helm
			:templ
			:terraform
			:hcl
			:json
			:yaml
			:tsx
			:sql
			:gomod
			:gowork
			:gosum]
    :highlight {:additional_vim_regex_highlighting [:ruby] :enable true}
    :indent {:disable [:ruby] :enable true}}}
    {1 :windwp/nvim-ts-autotag :opts {}}
    {1 :nvim-treesitter/nvim-treesitter-context}
    ]

