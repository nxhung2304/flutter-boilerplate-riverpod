.PHONY: run-dev run-staging run-production watch setup clean-ios install-hooks remove-hooks format

# Run
run-dev:
	@echo " Starting development environment..."
	fvm flutter run --dart-define=ENVIRONMENT=development

run-staging:
	@echo " Starting staging environment..."
	fvm flutter run --dart-define=ENVIRONMENT=staging

run-production:
	@echo " Starting production environment..."
	fvm flutter run --dart-define=ENVIRONMENT=production --release

# Setup
watch:
	dart run build_runner watch -d

setup:
	fvm flutter pub get
	dart run build_runner build --delete-conflicting-outputs
	make install-hooks
	cp .env.development.sample .env.development
	cp .env.staging.sample .env.staging
	cp .env.production.sample .env.production

clean-ios:
	cd ios/
	rm -rf Pods Podfile.lock
	cd ..
	fvm flutter clean
	fvm flutter pub get

format:
	@echo "Formatting Dart code..."
	dart format .
	@echo "Code formatting completed!"

# Git
HOOKS = commit-msg pre-commit

install-hooks:
	@for hook in $(HOOKS); do \
		cp tools/git/hooks/$$hook .git/hooks/$$hook && chmod +x .git/hooks/$$hook; \
		echo "Installed hook: $$hook"; \
	done
	@echo "All Git hooks installed!"

remove-hooks:
	@for hook in $(HOOKS); do \
		if [ -f .git/hooks/$$hook ]; then \
			rm .git/hooks/$$hook; \
			echo "Removed hook: $$hook"; \
		else \
			echo "Hook not found: $$hook"; \
		fi \
	done
	@echo "All git hooks processed!"

help:
	@echo "Available commands:"
	@echo ""
	@echo "Development:"
	@echo "  watch          Watch for changes and regenerate code"
	@echo "  setup          Initial project setup (pub get + generate + hooks)"
	@echo "  format         Format all Dart code in the project"
	@echo "  clean-ios      Clean and reset iOS project"
	@echo ""
	@echo "Running:"
	@echo "  run-dev        Run development environment"
	@echo "  run-staging    Run staging environment"
	@echo "  run-production Run production environment"
	@echo ""
	@echo "Git Hooks:"
	@echo "  install-hooks  Install git hooks (pre-commit format + commit-msg validation)"
	@echo "  remove-hooks   Remove git hooks"
	@echo ""
	@echo "Usage: make <command>"
