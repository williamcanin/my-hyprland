# Development variables
BRANCH := $(shell git branch --show-current)
REMOTES := $(shell git remote)

.DEFAULT_GOAL := help

.PHONY: help help-dev upgrade install uninstall version push push-lease

# ----- Menu help -----
help:
	@echo "my-environment — installation targets:"
	@echo "  install      Install from local repository"
	@echo "  upgrade      Pull latest and reinstall"
	@echo "  uninstall    Uninstall (add ARGS='--dry-run' to preview)"
	@echo "  version      Show version"
	@echo "  help         This message"
	@echo "  help-dev     Show development commands"

help-dev:
	@sh .tools/setup.sh --help-dev

# ----- Installation/Upgrade (user commands) -----
upgrade:
	@sh .tools/setup.sh --upgrade

install:
	@sh .tools/setup.sh --install

uninstall:
	@sh .tools/setup.sh --uninstall $(ARGS)

version:
	@sh .tools/setup.sh --version

set-permissions:
	@find src/config -type f -name "*.sh" -exec chmod +x {} \;
	@find .tools/installer -type f -name "*.sh" -exec chmod +x {} \;
	@chmod +x .tools/setup.sh

# ----- GIT PUSH (development commands) -----
push:
	@echo "Push normal → branch: $(BRANCH)"
	@for remote in $(REMOTES); do \
		echo "  pushing to $$remote..."; \
		git push $$remote $(BRANCH); \
	done

push-lease:
	@echo "Push --force-with-lease → branch: $(BRANCH)"
	@for remote in $(REMOTES); do \
		echo "  pushing to $$remote..."; \
		git push --force-with-lease $$remote $(BRANCH); \
	done
