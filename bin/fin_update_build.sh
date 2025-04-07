#!/bin/bash

MASTER_INSTALL_DIR=scripts/MasterInstaller

if [ -d "$MASTER_INSTALL_DIR/payload/update" ]; then

cd $MASTER_INSTALL_DIR/payload/update

# if there are .tar-files, then unpack them

tar -xvf *.tar 
rm *.tar

# build a new tar file containing ALL new update files 
tar -cvf ../finspyV2.tar ./*

# build the installer tar file containing:
#       ./fin_update_installer_script
#       ./finspyV2.tar

# cd to ../payload
cd ..
rm -rf update

tar cf ../payload.tar ./*

cd ..

if [ -e "payload.tar" ]; then
gzip payload.tar

if [ -e "payload.tar.gz" ]; then
cat tools/fin_decompress payload.tar.gz > selfextract.ggi
chmod +x selfextract.ggi
rm payload.tar.gz
else
echo "payload.tar.gz does not exist"
exit 1
fi
else
echo "payload.tar does not exist"
exit 1
fi

echo "selfextract.ggi created"
else
echo "$MASTER_INSTALL_DIR/payload/update"
exit 1
fi
exit 0
