require './lib/enigma'
require 'pry'

enigma = Enigma.new

puts "Enter file name to decrypt: "

# encrypted.txt
scrambled_lines = File.read(encrypted.txt).split("\n")

decrypted_text = ""
scrambled_lines.each do |line|
  decrypted_text += enigma.encrypt(line)[:encryption] + "\n"
end
decrypted_text.chomp!


puts "Enter the file name to write the decryption to: "

# decrypted.txt
decrypted_file_name = gets.chomp
decrypted_file = File.open(decrypted_file_name, "w")

decrypted_file.write(decrypted_text)

puts "Created '#{decrypted_file_name}' with the key #{enigma.random_key} and date #{enigma.today}"


# Takes four command line args:

# 1. Existing file with encrypted message.
# 2. File where program should write decrypted message.
# 3. Key to be used for decryption.
# 4. Date to be used for decryption.

# In addition, program should output to screen the file it wrote to
# Key used for decryption.
# Date used for decryption.


decryption_file = gets.chomp
# decrypted.txt

puts "Enter the key to be used for decryption: "
entered_key = gets.chomp

puts "Enter the date to be used for decryption: "
entered_date = gets.chomp


# print "Created 'decrypted.txt' with the key 82648 and date 240818"
