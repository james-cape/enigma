require './lib/enigma'
require 'pry'

enigma = Enigma.new

puts "Enter file name to decrypt: "
encrypted_file_name = gets.chomp # encrypted.txt

puts "Enter the file name to write the decryption to: "
decrypted_file_name = gets.chomp # decrypted.txt

puts "Enter the 5-digit key to be used for decryption: "
decryption_key = gets.chomp

puts "Enter the date (DDMMYY) to be used for decryption: "
decryption_date = gets.chomp


# decrypted.txt
scrambled_lines = File.read(encrypted_file_name).split("\n")
decrypted_text = ""
scrambled_lines.each do |line|
  # binding.pry
  decrypted_text += enigma.decrypt(line, decryption_key, decryption_date)[:decryption] + "\n"
end
decrypted_text.chomp!
# binding.pry

decrypted_file = File.open(decrypted_file_name, "w")

decrypted_file.write(decrypted_text)

puts "Created '#{decrypted_file_name}' with the key #{decryption_key} and date #{decryption_date}"
