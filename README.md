# Enigma

## About
Enigma is a solo project using Ruby to build a tool for cracking an encryption algorithm based on Alan Turing's enigma machine. Enigma allows a user to encrypt messages using a series of letter shifts using the command line interface.

## Local Setup

1. Fork and clone the repo

2. To encrypt text:

    a. Find or create a .txt file (or use the provided decrpyted.txt)

    b. Create a file where you'd like to store the encrypted text

    c. Run: $ ruby ./lib/encrypt.rb unencrypted_file_name.txt encrypted.txt

    d. This will return a message stating something like: Created 'encrypted.txt' with the key 82648 and date 240818

    e. Check the encrypted text file to see the encrypted message!

3. To decrypt text:

    a. Decrypt with the key and date:

    You'll need your encrypted file, a file to store your decrypted message, the 5-digit key, and 6-digit date from your encryption.

    Run: $ ruby ./lib/decrypt.rb encrypted.txt decrypted.txt 82648 240818

    Check the updated text file to see the decrypted message!

    b. Crack the code without knowing the key:

    You'll still need the two files: the encrypted text file and a file to store the decrypted message.

    You'll also need the 6-digit date on which the message was encrypted.

    Run: $ ruby ./lib/crack.rb encrypted.txt cracked.txt 240818

Check the updated text file to see the decrypted message!

## Interaction Pattern

### The Enigma class should respond to the following interaction pattern:
``` ruby
pry(main)> require 'date'
#=> true

pry(main)> require './lib/enigma'
#=> true

pry(main)> enigma = Enigma.new
#=> #<Enigma:0x00007ff90f24cb78...>

# encrypt a message with a key and date
pry(main)> enigma.encrypt("hello world", "02715", "040895")
#=>
#   {
#     encryption: "keder ohulw",
#     key: "02715",
#     date: "040895"
#   }

# decrypt a message with a key and date
pry(main) > enigma.decrypt("keder ohulw", "02715", "040895")
#=>
#   {
#     decryption: "hello world",
#     key: "02715",
#     date: "040895"
#   }

# encrypt a message with a key (uses today's date)
pry(main)> encrypted = enigma.encrypt("hello world", "02715")
#=> # encryption hash here

#decrypt a message with a key (uses today's date)
pry(main) > enigma.decrypt(encrypted[:encryption], "02715")
#=> # decryption hash here

# encrypt a message (generates random key and uses today's date)
pry(main)> enigma.encrypt("hello world")
#=> # encryption hash here
```
