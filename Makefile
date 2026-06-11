# Development variables
BRANCH := $(shell git branch --show-current)
REMOTES := $(shell git remote)

.DEFAULT_GOAL := help

.PHONY: help help-dev upgrade install version push push-lease

# ----- Menu help -----
help:
	@sh .tools/installer/main.sh --help

help-dev:
	@sh .tools/installer/main.sh --help-dev

# ----- Installation/Upgrade (user commands) -----
upgrade:
	@sh .tools/installer/main.sh --upgrade

install:
	@sh .tools/installer/main.sh --install

version:
	@sh .tools/installer/main.sh --version

set-permissions:
	@find src/config -type f -name "*.sh" -exec chmod +x {} \;
	@find src/config -type f -name "*.lib" -exec chmod +x {} \;

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
