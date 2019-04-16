require './lib/enigma'
require './lib/cipher'
require 'pry'

cipher = Cipher.new
enigma = Enigma.new(cipher)

puts "Enter file name to decrypt: "
encrypted_file_name = gets.chomp # encrypted.txt

puts "Enter the file name to write the cracked message to: "
cracked_file_name = gets.chomp # cracked.txt

puts "Enter the date (DDMMYY) to be used for decryption: "
date = gets.chomp

scrambled_lines = File.read(encrypted_file_name).split("\n")
cracked_text = ""
scrambled_lines.each do |line|
  cracked_text += enigma.crack(line, date)[:decryption] + "\n"
end
cracked_text.chomp!

cracked_file = File.open(cracked_file_name, "w")

cracked_file.write(cracked_text)

# puts "Created '#{cracked_file_name}' with the key #{key} and date #{date}"
