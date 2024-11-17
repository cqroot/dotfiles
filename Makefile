define diff_dir
	difft --check-only --skip-unchanged $(1) $(2)
endef

.PHONY: diff_pwsh
diff_pwsh:
	$(call diff_dir,"$(CURDIR)/pwsh", "$$HOME/Documents/WindowsPowerShell")

.PHONY: diff
diff: diff_pwsh
