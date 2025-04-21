.PHONY: test
test: ## Run e2e tests
	make build
	bunx playwright test
