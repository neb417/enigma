decrypt = File.new(ARGV[0], 'r')
message_to_decrypt = decrypt.read
decrypt.close

puts message_to_decrypt