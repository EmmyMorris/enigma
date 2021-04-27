require 'time'
require './lib/enigma'
enigma = Enigma.new

read = File.open(ARGV[0], 'r')
user_input = read.read
read.close

decrypt_output = enigma.decrypt(user_input.chomp, ARGV[2], ARGV[3])
write = File.open(ARGV[1], 'w')
write.write(decrypt_output[:decryption])
write.close

puts "Created #{ARGV[1]} with the key #{decrypt_output[:key]} and date #{decrypt_output[:date]}."
