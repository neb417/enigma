# Enigma

To run, navigate to folder which files reside.

To encrypt, type the below into terminal
  1. ruby lib/encrypt.rb message.txt encrypted.txt

Should output message
  1. Created encrypted.txt with key ##### and date DDMMYY

To decrypt, type below into terminal
  1. lib/decrypt.rb encrypted.txt decrypted.txt 5_digit_key DDMMYY

Should output message
  1. Created decrypted.txt with key ##### and date DDMMYY