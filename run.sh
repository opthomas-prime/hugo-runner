#!/usr/bin/env sh

hugo_update() {
	orig_wd=`pwd`
	wd=/tmp/`date +%s`
	mkdir $wd && cd $wd
	git clone --recurse-submodules ${HUGO_WEBSITE_REPO}
	if [ $? -eq 0 ]; then
		cd `basename ${HUGO_WEBSITE_REPO} .git`
		hugo
		cp -r public/* /usr/share/nginx/html/
	fi
	cd $orig_wd
	rm -r $wd
}

if [ -z "${HUGO_WEBSITE_REPO}" ]; then
	echo "HUGO_WEBSITE_REPO is not set... exiting"
	exit 1
fi

nginx

while true; do
	hugo_update
	sleep 3600
done
