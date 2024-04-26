runner:
	dart run build_runner build --delete-conflicting-outputs
wrunner:
	dart run build_runner watch --delete-conflicting-outputs

default-minimal-run: 
	flutter run

run:
	xcrun simctl uninstall aa com.dreampuppy
	make default-minimal-run