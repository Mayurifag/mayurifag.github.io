.PHONY: astro dev build preview install remove update-deps test clean

ASTRO = bunx --bun astro
astro:
	@$(ASTRO) $(ARGS)

dev:
	@$(ASTRO) dev

build:
	@bun run build

preview: build
	@$(ASTRO) preview

install:
	@bun install $(ARGS)

remove:
	@bun remove $(ARGS)

update-deps:
	@bun update --latest

test: build
	@bun run test:e2e

clean:
	rm -rf dist/ .astro/
