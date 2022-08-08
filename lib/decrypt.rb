require_relative 'enigma'

enigma = Enigma.new

decrypt = File.new(ARGV[0], 'r')
message_to_decrypt = decrypt.read
decrypt.close

decrypted_message = File.new(ARGV[1], 'w')
message = enigma.decrypt(message_to_decrypt, ARGV[2], ARGV[3])
decrypted_message.write(message[:decryption])
decrypted_message.close

puts "Created #{ARGV[1]} with key #{ARGV[2]} and date #{ARGV[3]}"