.PHONY: apply
apply:
	@bash "$(CURDIR)/scripts/dots.sh" apply

.PHONY: revoke
revoke:
	@bash "$(CURDIR)/scripts/dots.sh" revoke

.PHONY: status
status:
	@bash "$(CURDIR)/scripts/dots.sh" status | column -t
