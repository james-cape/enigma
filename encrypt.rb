require './lib/enigma'
require 'pry'

enigma = Enigma.new
tim = Time.new

puts "Enter file name to encrypt: "

raw_file = File.read(gets.chomp)
# message.txt

binding.pry
raw_file = enigma.encrypt(File.read(gets.chomp))

# message.txt

# encrypt(File.read(gets.chomp))


puts "Enter the file name to write the encryption to: "

# encryption_file = gets.chomp
# encrypted.txt

encrypted_file = File.new(gets.chomp)

File.write(encrypted_file, raw_file)

puts "Created 'encrypted.txt' with the key 82648 and date 240818"
