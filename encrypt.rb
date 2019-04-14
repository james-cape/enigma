require './lib/enigma'
require 'pry'

enigma = Enigma.new

puts "Enter file name to encrypt: "
raw_lines = File.read(gets.chomp).split("\n") # message.txt

encrypted_text = ""
raw_lines.each do |line|
  encrypted_text += enigma.encrypt(line)[:encryption] + "\n"
end
encrypted_text.chomp!


puts "Enter the file name to write the encryption to: "

# encrypted.txt
encrypted_file_name = gets.chomp
encrypted_file = File.open(encrypted_file_name, "w")

encrypted_file.write(encrypted_text)

puts "Created '#{encrypted_file_name}' with the key #{enigma.random_key} and date #{enigma.today}"
