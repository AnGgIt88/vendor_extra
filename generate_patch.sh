#!/bin/sh

Color_Off="\033[0m"
BRed="\033[1;31m"
BGreen="\033[1;32m"
Red="\033[0;31m"
Green="\033[0;32m"

printf "%bOutput of this script will be recorded in last_generate_patch_output.log file%b\n" "$BRed" "$Color_Off"

if [ "$(basename "$PWD")" = extra ]; then
	cd ../..
fi

. build/envsetup.sh
TOP="${ANDROID_BUILD_TOP}"

if [ "$(basename "$PWD")" != extra ]; then
        LOG=$TOP/vendor/extra
else
	LOG="$PWD"
fi

repos="
frameworks/av
frameworks/base
frameworks/native
frameworks/opt/telephony
lineage-sdk
packages/apps/Settings
packages/apps/Trebuchet
packages/apps/Updater
system/core
vendor/lineage"

rm -rf $TOP/vendor/extra/patches

((

generate_patch() {
	for repo in $repos; do
		rm -rf $TOP/vendor/extra/patches/$repo/*.patches
		cd $TOP/$repo
		printf "%b\nGenerating $repo patches ...%b\n\n" "$BGreen" "$Color_Off"
		git format-patch m/lineage-18.1..HEAD -o $TOP/vendor/extra/patches/$repo/
		shift
	done
}

generate_patch

) 2>&1) | tee $LOG/last_generate_patch_output.log

git_push() {
	printf "%b\nPushing to GitHub%b\n\n" "$BGreen" "$Color_Off"
	cd $TOP/vendor/extra/
	git add patches/
	git commit -s -m "extra: generated patches as on $(date)"
	git push
}

git_push
