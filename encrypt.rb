require './lib/enigma'
require 'pry'
# Takes two command line arguments

# first is existing file to encrypt

# second is a file to write the encryption to.

#program should also output to the screen:
# - file it wrote to
# - key
# - date

puts "Enter file name to encrypt: "

raw_file = gets.chomp
# message.txt

encrypt(File.read(raw_file))



puts "Enter the file name to write the encryption to: "

encryption_file = gets.chomp
# encrypted.txt




# print "Created 'encrypted.txt' with the key 82648 and date 240818"
