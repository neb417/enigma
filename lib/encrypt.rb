require 'pry'
msg_encrypt = File.open(ARGV[0],"r")
# binding.pry
message_to_encrypt = msg_encrypt.read

msg_encrypt.close

puts message_to_encrypt