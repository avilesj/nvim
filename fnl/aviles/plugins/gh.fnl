[{
  1 :ldelossa/gh.nvim
  :dependencies [{
		  1 :ldelossa/litee.nvim
		  :config (fn []
			    (. (require :litee.lib) :setup)
			    )
		  }]
  :config (fn []
	    (. (require :litee.gh) :setup)
	    )
  }]
