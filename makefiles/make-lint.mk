.PHONY: lint
lint: ## Run all linters
	editorconfig-checker
	markdownlint-cli2 '**/*.md'
	yamllint .
