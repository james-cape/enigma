#runner file

# Takes four command line args:

# 1. Existing file with encrypted message.
# 2. File where program should write decrypted message.
# 3. Key to be used for decryption.
# 4. Date to be used for decryption.

# In addition, program should output to screen the file it wrote to
# Key used for decryption.
# Date used for decryption.

puts "Enter file name to decrypt: "

encryption_file = gets.chomp
# encrypted.txt



puts "Enter the file name to write the decryption to: "

decryption_file = gets.chomp
# decrypted.txt

puts "Enter the key to be used for decryption: "
entered_key = gets.chomp

puts "Enter the date to be used for decryption: "
entered_date = gets.chomp


# print "Created 'decrypted.txt' with the key 82648 and date 240818"
