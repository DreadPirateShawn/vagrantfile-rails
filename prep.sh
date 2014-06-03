#!/usr/bin/env bash

echo "########################################"
echo "# THIS WILL TAKE AWHILE. GO READ A BOOK?"


echo "############"
echo "# Set locale"

# http://serverfault.com/questions/500764/dpkg-reconfigure-unable-to-re-open-stdin-no-file-or-directory
# http://www.thomas-krenn.com/en/wiki/Perl_warning_Setting_locale_failed_in_Debian
export LANGUAGE=en_US.UTF-8
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
locale-gen en_US.UTF-8
dpkg-reconfigure locales

