require 'time'
require './lib/enigma'
enigma = Enigma.new

message = File.open(ARGV[0], 'r')
user_input = message.read
message.close
encrypt_output = enigma.encrypt(user_input.chomp)
encrypted = File.open(ARGV[1], 'w')
encrypted.write(encrypt_output[:encryption])
encrypted.close

puts "Created #{ARGV[1]} with the key #{encrypt_output[:key]} and date #{encrypt_output[:date]}."
