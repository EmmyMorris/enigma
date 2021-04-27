# Self Assessment-
  1. Functionality-
    * I believe I successfully implemented the two methods and the encrypt/decrypt command line interfaces. I believe I could possibly score between a 2.5 - 3.
  2. OOP-
    * I believe my project is broken into logical components that are appropriately encapsulated. I am not sure if it would be better so make two classes or not. I can articulate the single responsibilities of the various components. I believe I could score in between a 2.5 - 3.
  3. Ruby Conventions and Mechanics-
    * I believe my code properly demonstrates indenting, spacing, and naming convention. I believe some of my lines could be too long, but I can speak to why I used certain enumerables/data structures. I believe I could score between a 2.5 - 3.
  4. TTD-
    * I believe I tested every method, but I could have not tested for edge cases though. I believe I could possibly score between a 2.5 - 3.


# Interaction Pattern

## The Enigma class should respond to the following interaction pattern:
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
