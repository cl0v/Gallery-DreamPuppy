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
	xcrun simctl uninstall 2497924F-222E-49E7-A6CB-36B2F3808DB1 com.dreampuppy
	flutter clean
	flutter run

openurl:
	xcrun simctl openurl 2497924F-222E-49E7-A6CB-36B2F3808DB1  https://www.dreampuppy.com.br/filhotes/2