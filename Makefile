.PHONY: apply
apply:
	@bash "$(CURDIR)/scripts/dot-apply.sh"

.PHONY: revoke
revoke:
	@bash "$(CURDIR)/scripts/dot-revoke.sh"

.PHONY: check
check:
	@bash "$(CURDIR)/scripts/dot-check.sh"
