require 'time'
require './lib/enigma'
enigma = Enigma.new

read = File.open(ARGV[0], 'r')
user_input = read.read
read.close
encrypt_output = enigma.encrypt(user_input.chomp, ARGV[2], ARGV[3])
write = File.open(ARGV[1], 'w')
write.write(encrypt_output[:encryption])
write.close

puts "Created #{ARGV[1]} with the key #{encrypt_output[:key]} and date #{encrypt_output[:date]}."
