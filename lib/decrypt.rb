require 'time'
require './lib/enigma'
enigma = Enigma.new

message = File.open(ARGV[0], 'r')
user_input = message.read
message.close

decrypt_output = enigma.decrypt(user_input.chomp, ARGV[2], ARGV[3])
decrypted = File.open(ARGV[1], 'w')
decrypted.write(decrypt_output[:decryption])
decrypted.close

puts "Created #{ARGV[1]} with the key #{decrypt_output[:key]} and date #{decrypt_output[:date]}."
