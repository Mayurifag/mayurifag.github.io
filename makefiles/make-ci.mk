.PHONY: ci

ci:
	@editorconfig-checker
	@markdownlint-cli2 '**/*.md' '!node_modules/**'
	@yamllint --config-file .yamllint.yml .
