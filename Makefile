runner:
	dart run build_runner build --delete-conflicting-outputs
wrunner:
	dart run build_runner watch --delete-conflicting-outputs

default-minimal-run: 
	flutter run

run:
	xcrun simctl uninstall aa com.dreampuppy
	make default-minimal-run

cleanrun:
	# adb uninstall com.dreampuppy.gallery
	xcrun simctl uninstall booted com.dreampuppy
	flutter clean
	flutter run

openurl:
	xcrun simctl openurl booted  https://www.dreampuppy.com.br/filhotes/2