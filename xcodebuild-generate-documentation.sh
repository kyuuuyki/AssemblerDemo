xcodebuild docbuild -scheme AssemblerDemo \
-destination generic/platform=iOS \
OTHER_DOCC_FLAGS="--transform-for-static-hosting --output-path docs --hosting-base-path AssemblerDemo"
