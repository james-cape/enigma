require './lib/cracker'
require './lib/cipher'
require './lib/shifter'
require './lib/enigma'

cipher = Cipher.new
cracker = Cracker.new
enigma = Enigma.new(cracker)

crack_from, crack_to, date = ARGV

scrambled_lines = File.read(crack_from).split("\n")
cracked_text = ""
key = enigma.crack(scrambled_lines[0].dup, date)[:key]
scrambled_lines.each do |line|
  cracked_text += enigma.crack(line, date)[:decryption] + "\n"
end
cracked_text.chomp!

cracked_file = File.open(crack_to, "w")

cracked_file.write(cracked_text)

puts "Created '#{crack_to}' with the key #{key} and date #{date}"
