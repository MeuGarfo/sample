#!/bin/bash
clear
touch offline

# variaveis
php=`which php`

# inc
rm -rf inc
git clone https://github.com/aicoutos/inc.git

# migrate
$php inc/migrate.php

# pasta assets
rm -rf asset
mkdir asset
# bootstrap
mkdir asset/bootstrap
cp -r bower_components/bootstrap/dist/ asset/bootstrap/dist/
# jquery
mkdir asset/jquery
cp -r bower_components/jquery/dist/ asset/jquery/dist/
# jquery-loading
mkdir asset/jquery-loading
cp -r bower_components/jquery-loading/dist/ asset/jquery-loading/dist/
# summernote
mkdir asset/summernote
cp -r bower_components/summernote/dist/ asset/summernote/dist/

rm offline
