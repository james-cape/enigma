require './lib/enigma'
require './lib/cipher'
require 'pry'

cipher = Cipher.new
enigma = Enigma.new(cipher)

puts "Enter file name to decrypt: "
encrypted_file_name = gets.chomp # encrypted.txt

puts "Enter the file name to write the decryption to: "
decrypted_file_name = gets.chomp # decrypted.txt

puts "Enter the 5-digit key to be used for decryption: "
key = gets.chomp

puts "Enter the date (DDMMYY) to be used for decryption: "
date = gets.chomp

scrambled_lines = File.read(encrypted_file_name).split("\n")
decrypted_text = ""
scrambled_lines.each do |line|
  decrypted_text += enigma.decrypt(line, key, date)[:decryption] + "\n"
end
decrypted_text.chomp!

decrypted_file = File.open(decrypted_file_name, "w")

decrypted_file.write(decrypted_text)

puts "Created '#{decrypted_file_name}' with the key #{key} and date #{date}"
