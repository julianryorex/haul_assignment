
clean:
	rm -rf build
	rm -rf ios/build
	rm -rf .dart_tool/
	flutter clean 

gen-built:
	flutter packages pub run build_runner build --delete-conflicting-outputs

pub-get:
	flutter pub get
	flutter packages pub run build_runner build --delete-conflicting-outputs