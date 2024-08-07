# .PHONY: gen genAll rebuild check get localize runDev runDevQa runDevStaging lines release apk

rebuild:
	flutter clean
	flutter pub get
	flutter run

run:
	flutter run

check:
	dart analyze .

runDev:
	flutter run --flavor dev -t lib/main.dart

release:
	flutter run --release --no-tree-shake-icons

apk:
	flutter build apk --release --no-tree-shake-icons

force_upgrade:
	flutter update-packages --force-upgrade
