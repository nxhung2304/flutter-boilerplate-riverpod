.PHONY: watch generate run-dev run-staging run-production setup clean test test-coverage analyze format format-check build-dev build-staging build-production build-ios-dev build-ios-staging build-ios-production install-hooks remove-hooks help

# Development commands
watch:
	dart run build_runner watch -d

generate:
	dart run build_runner build --delete-conflicting-outputs

# Run commands
run-dev:
	fvm flutter run --dart-define=FLAVOR=development
run-staging:
	fvm flutter run --dart-define=FLAVOR=staging
run-production:
	fvm flutter run --dart-define=FLAVOR=production

# Setup commands
setup:
	fvm flutter pub get
	dart run build_runner build --delete-conflicting-outputs
	make install-hooks

clean:
	fvm flutter clean
	fvm flutter pub get

# Testing commands
test:
	fvm flutter test

test-coverage:
	fvm flutter test --coverage
	genhtml coverage/lcov.info -o coverage/html

# Code quality
analyze:
	fvm flutter analyze

format:
	dart format .

format-check:
	dart format --set-exit-if-changed .

# Build commands
build-dev:
	fvm flutter build apk --dart-define=FLAVOR=development

build-staging:
	fvm flutter build apk --dart-define=FLAVOR=staging

build-production:
	fvm flutter build apk --dart-define=FLAVOR=production

build-ios-dev:
	fvm flutter build ios --dart-define=FLAVOR=development

build-ios-staging:
	fvm flutter build ios --dart-define=FLAVOR=staging

build-ios-production:
	fvm flutter build ios --dart-define=FLAVOR=production

HOOKS = commit-msg

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
	@echo "  generate       One-time code generation"
	@echo "  setup          Initial project setup (pub get + generate + hooks)"
	@echo "  clean          Clean and reset project"
	@echo ""
	@echo "Running:"
	@echo "  run-dev        Run development environment"
	@echo "  run-staging    Run staging environment"
	@echo "  run-production Run production environment"
	@echo ""
	@echo "Testing:"
	@echo "  test           Run all tests"
	@echo "  test-coverage  Generate test coverage report"
	@echo ""
	@echo "Code Quality:"
	@echo "  analyze        Run static analysis"
	@echo "  format         Format all code"
	@echo "  format-check   Check if code is properly formatted"
	@echo ""
	@echo "Building:"
	@echo "  build-dev      Build APK for development"
	@echo "  build-staging  Build APK for staging"
	@echo "  build-production Build APK for production"
	@echo "  build-ios-dev  Build iOS for development"
	@echo "  build-ios-staging Build iOS for staging"
	@echo "  build-ios-production Build iOS for production"
	@echo ""
	@echo "Git Hooks:"
	@echo "  install-hooks  Install git commit hooks"
	@echo "  remove-hooks   Remove git commit hooks"
	@echo ""
	@echo "Usage: make <command>"

