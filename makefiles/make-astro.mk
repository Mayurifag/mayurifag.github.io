.PHONY: astro dev build preview install remove

ASTRO = bunx --bun astro
astro:
	@$(ASTRO) $(ARGS)

dev:
	@$(ASTRO) dev

build:
	@$(ASTRO) build

preview: build
	@$(ASTRO) preview

install:
	@bun install $(ARGS)

remove:
	@bun remove $(ARGS)
