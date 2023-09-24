require 'json'

if ARGV.length < 2
  puts "Usage: your_bittorrent.sh <command> <args>"
  exit(1)
end

def decode_bencode(bencoded_value)
  if bencoded_value[0].chr.match?(/\d/)
    length = bencoded_value.split(':')[0].to_i
    return bencoded_value.split(':')[1][0, length]
  else
    puts "Only strings are supported at the moment"
    exit(1)
  end
end

command = ARGV[0]

if command == "decode"
    encoded_str = ARGV[1]
    decoded_str = decode_bencode(encoded_str)
    puts JSON.generate(decoded_str)
end
