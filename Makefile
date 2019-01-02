SHELL=/bin/bash

.DEFAULT_GOAL := help

.PHONY: help
help:
	grep -E '^[a-zA-Z-]+:.*?## .*$$' Makefile | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "[32m%-12s[0m %s\n", $$1, $$2}'

.PHONY: install
install: ## Install dotfiles in its desired locations
	./make/install.sh

.PHONY: backup
backup: ## Backup all dotfiles to this repo
	./make/backup.sh
