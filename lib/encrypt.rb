require 'pry'

msg_encrypt = File.open(ARGV[0],"r")
message_to_encrypt = msg_encrypt.read

encrypted_message = File.open(ARGV[1], "w")

encrypted_message.write(message_to_encrypt.upcase)

msg_encrypt.close

puts message_to_encrypt
