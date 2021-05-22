#!/bin/sh

Color_Off="\033[0m"
BRed="\033[1;31m"
BGreen="\033[1;32m"
Red="\033[0;31m"
Green="\033[0;32m"

printf "%bOutput of this script will be recorded in last_apply_patch_output.log file%b\n" "$BRed" "$Color_Off"

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
prebuilts/abi-dumps/vndk
system/core
vendor/lineage"

((

apply_patch() {
	CONFLICT=""
	for repo in $repos; do
		cd $TOP/$repo
		printf "%b\nApplying patches in $repo ...%b\n\n" "$BGreen" "$Color_Off"
		git am --abort 2>/dev/null
		git am $TOP/vendor/extra/patches/$repo/*
		if [[ -n "$(git status --porcelain)" ]]; then
			CONFLICT="conflict-"
		printf "\n%b${CONFLICT} in repo $repo%b\n" "Red" "$Color_Off"
		else
		printf "\n%bApplied patches successfully in $repo%b\n" "$Green" "$Color_Off"
		fi
		shift
	done
}

apply_patch

) 2>&1) | tee $LOG/last_apply_patch_output.log
