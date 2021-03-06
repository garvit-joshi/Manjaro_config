#!/bin/bash

# List of Commands to enable Secure boot on Manjaro
# Link: https://wiki.gentoo.org/wiki/User:Sakaki/Sakaki%27s_EFI_Install_Guide/Configuring_Secure_Boot#Saving_Current_Keystore_Values.2C_and_Creating_New_Keys
sudo pacman -S efitools
curl https://github.com/andreyv.gpg | gpg --import
pamac build sbupdate
sudo su   #Enter Superuser
mkdir -p -v /etc/efikeys
chmod -v 700 /etc/efikeys
cd /etc/efikeys
efi-readvar -v PK -o old_PK.esl
efi-readvar -v KEK -o old_KEK.esl
efi-readvar -v db -o old_db.esl
efi-readvar -v dbx -o old_dbx.esl
openssl req -new -x509 -newkey rsa:2048 -subj "/CN=Garvit's platform key/" -keyout PK.key -out PK.crt -days 3650 -nodes -sha256
openssl req -new -x509 -newkey rsa:2048 -subj "/CN=Garvit's key-exchange-key/" -keyout KEK.key -out KEK.crt -days 3650 -nodes -sha256
openssl req -new -x509 -newkey rsa:2048 -subj "/CN=Garvit's kernel-signing key/" -keyout db.key -out db.crt -days 3650 -nodes -sha256
cert-to-efi-sig-list -g "$(uuidgen)" PK.crt PK.esl
sign-efi-sig-list -k PK.key -c PK.crt PK PK.esl PK.auth
cert-to-efi-sig-list -g "$(uuidgen)" KEK.crt KEK.esl
sign-efi-sig-list -a -k PK.key -c PK.crt KEK KEK.esl KEK.auth
cert-to-efi-sig-list -g "$(uuidgen)" db.crt db.esl
sign-efi-sig-list -a -k KEK.key -c KEK.crt db db.esl db.auth
sign-efi-sig-list -k KEK.key -c KEK.crt dbx old_dbx.esl old_dbx.auth
openssl x509 -outform DER -in PK.crt -out PK.cer
openssl x509 -outform DER -in KEK.crt -out KEK.cer
openssl x509 -outform DER -in db.crt -out db.cer
cat old_KEK.esl KEK.esl > compound_KEK.esl
cat old_db.esl db.esl > compound_db.esl
sign-efi-sig-list -k PK.key -c PK.crt KEK compound_KEK.esl compound_KEK.auth
sign-efi-sig-list -k KEK.key -c KEK.crt db compound_db.esl compound_db.auth
cp -v *.{auth,cer,crt,esl} /boot/efi/
exit # Exit Superuser
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=Manjaro --modules="normal test efi_gop efi_uga search echo linux all_video gfxmenu gfxterm_background gfxterm_menu gfxterm loadenv configfile tpm" --disable-shim-lock