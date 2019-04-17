require './lib/cipher'
require './lib/shifter'
require './lib/enigma'

cipher = Cipher.new
enigma = Enigma.new(cipher)

encrypt_from, encrypt_to = ARGV

encrypted_text = ""
File.read(encrypt_from).split("\n").each do |line|
  encrypted_text += enigma.encrypt(line)[:encryption] + "\n"
end
encrypted_text.chomp!

File.open(encrypt_to, "w").write(encrypted_text)

puts "Created '#{encrypt_to}' with the key #{enigma.random_key} and date #{enigma.today}"
