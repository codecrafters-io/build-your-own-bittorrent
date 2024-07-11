require 'json'

if ARGV.length < 2
  puts "Usage: your_bittorrent.sh <command> <args>"
  exit(1)
end

def decode_bencode(bencoded_value)
  if bencoded_value[0].chr.match?(/\d/)
    first_colon = bencoded_value.index(':')
    if first_colon.nil?
      raise ArgumentError, "Invalid encoded value"
    end
    return bencoded_value[first_colon+1..-1]
  else
    puts "Only strings are supported at the moment"
    exit(1)
  end
end

command = ARGV[0]

if command == "decode"
    # You can use print statements as follows for debugging, they'll be visible when running tests.
    puts "Logs from your program will appear here"
    
    # Uncomment this block to pass the first stage
    # encoded_str = ARGV[1]
    # decoded_str = decode_bencode(encoded_str)
    # puts JSON.generate(decoded_str)
end

