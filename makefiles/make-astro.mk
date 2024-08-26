ASTRO = bunx --bun astro
.PHONY: astro dev build preview

astro:
	@$(ASTRO) $(ARGS)

dev:
	@$(ASTRO) dev

build:
	@$(ASTRO) build

preview: build
	@$(ASTRO) preview
