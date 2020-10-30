#!/bin/bash
#
# git clone ACS repositoy and checkout the branch named "acs/$ACS_TAG"
# $ACS_TAG is usually something like 2020AUG
#
# script fails if $ACS_TAG is not defined.
# script expects git lfs to be installed
source ./VERSION

set -u # aborts automatically if we try to expand an undefined variable
: "$ACS_TAG"  # tries to expand variable in a no-op context.


git clone https://bitbucket.alma.cl/scm/asw/acs.git ./acs
cd ./acs
git checkout acs/$ACS_TAG || true

cd ExtProd/PRODUCTS
rm -f boost_1_66_0.tar.bz2
curl -L https://dl.bintray.com/boostorg/release/1.66.0/source/boost_1_66_0.tar.bz2 \
     --output boost_1_66_0.tar.bz2

