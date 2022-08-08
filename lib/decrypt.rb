decrypt = File.new(ARGV[0], 'r')
message_to_decrypt = decrypt.read
decrypt.close

decrypted_message = File.new(ARGV[1], 'w')
decrypted_message.write(message_to_decrypt)
decrypted_message.close
puts message_to_decrypt