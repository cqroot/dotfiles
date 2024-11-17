define diff_dir
	difft --check-only --skip-unchanged $(1) $(2)
endef

define apply_dir
	cp -aT $(1) $(2)
endef

.PHONY: diff_bash
diff_bash:
	$(call diff_dir,"$(CURDIR)/bash",  "$$HOME/.config/bash")

.PHONY: apply_bash
apply_bash:
	$(call apply_dir,"$(CURDIR)/bash", "$$HOME/.config/bash")

.PHONY: diff_nvim
diff_nvim:
	$(call diff_dir,"$(CURDIR)/nvim",  "$$LOCALAPPDATA/nvim")

.PHONY: apply_nvim
apply_nvim:
	$(call apply_dir,"$(CURDIR)/nvim", "$$LOCALAPPDATA/nvim")

.PHONY: diff_pwsh
diff_pwsh:
	$(call diff_dir,"$(CURDIR)/pwsh",  "$$HOME/Documents/WindowsPowerShell")

.PHONY: apply_pwsh
apply_pwsh:
	$(call apply_dir,"$(CURDIR)/pwsh", "$$HOME/Documents/WindowsPowerShell")

.PHONY: diff
diff: diff_bash diff_pwsh diff_nvim

.PHONY: apply
apply: apply_bash apply_pwsh apply_nvim
