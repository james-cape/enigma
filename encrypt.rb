require './lib/enigma'
require 'pry'

enigma = Enigma.new
time = Time.new

puts "Enter file name to encrypt: "

# raw_file = gets.chomp
# message.txt

raw_lines = File.read(gets.chomp).split("\n")

encrypted_text = ""
encrypted_lines = raw_lines.each do |line|
  encrypted_text += enigma.encrypt(line)[:encryption] + "\n"
end
encrypted_text.chomp!
# text_lines = enigma.encrypt(File.read(gets.chomp)).split("\n")

# message.txt

# encrypt(File.read(gets.chomp))



puts "Enter the file name to write the encryption to: "

# encryption_file = gets.chomp
# encrypted.txt

encrypted_file = File.open(gets.chomp, "w")
# binding.pry

encrypted_file.write(encrypted_text)

# binding.pry

puts "Created 'encrypted.txt' with the key 82648 and date 240818"
