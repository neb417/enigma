# Enigma

## Rubric Eval
  1. Funcitonality - 3.0, Enigma, encrypt, and decrypt methods successfully implemented. Encrypt/decrypt command line interfaces successfully implemented

  1. OOP - 4.0, Implemented a module to handle all of the logic for encrypting and decrypting.

  1. Ruby Conventions - 4.0, no methods longer than 10 lines. variable names appropriatly named, space/indentation consistent, 100% on simplecov.

  1. TDD - 4.0,  Several mocks implemented for testing randomness. Test coverage at 100%.
  
To run, navigate to folder which files reside.

To encrypt, type the below into terminal
  1. ruby lib/encrypt.rb message.txt encrypted.txt

Should output message
  1. Created encrypted.txt with key ##### and date DDMMYY

To decrypt, type below into terminal
  1. lib/decrypt.rb encrypted.txt decrypted.txt 5_digit_key DDMMYY

Should output message
  1. Created decrypted.txt with key ##### and date DDMMYY

from: https://backend.turing.edu/module1/projects/enigma/requirements