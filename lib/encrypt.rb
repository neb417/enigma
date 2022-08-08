require_relative 'enigma'
enigma = Enigma.new

encrypt = File.open(ARGV[0],"r")
message_to_encrypt = encrypt.read
encrypt.close

encrypted_message = File.open(ARGV[1], "w")
message = enigma.encrypt(message_to_encrypt.downcase)
encrypted_message.write(message[:encryption])
encrypted_message.close

puts "Created #{ARGV[1]} with key #{enigma.key} and date #{enigma.date}"
