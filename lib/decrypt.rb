require './lib/cipher'
require './lib/shifter'
require './lib/enigma'

cipher = Cipher.new
enigma = Enigma.new(cipher)

decrypt_from, decrypt_to, key, date = ARGV

decrypted_text = ""
File.read(decrypt_from).split("\n").each do |line|
  decrypted_text += enigma.decrypt(line)[:decryption] + "\n"
end
decrypted_text.chomp!

decrypted_text = ""
File.read(decrypt_from).split("\n").each do |line|
  decrypted_text += enigma.decrypt(line, key, date)[:decryption] + "\n"
end
decrypted_text.chomp!

File.open(decrypt_to, "w").write(decrypted_text)

puts "Created '#{decrypt_to}' with the key #{key} and date #{date}"
