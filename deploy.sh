#!/bin/bash

SOURCE_DIR="/data/septvean/documents/public"

cd $(dirname $0)

[ ! -d ${SOURCE_DIR} ] && echo "source dir not exists" && exit 1

[ -d ./docs ] && rm -rf ./docs

mv -v ${SOURCE_DIR} ./docs

git restore docs/CNAME

git add .

git commit -m "update"

git push
