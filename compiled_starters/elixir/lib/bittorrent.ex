defmodule Bittorrent.CLI do
  def main(argv) do
      case argv do
          ["decode" | [encoded_str | _]] ->
              # You can use print statements as follows for debugging, they'll be visible when running tests.
              IO.puts("Logs from your program will appear here!")
              # Uncomment this block to pass the first stage
              #Bencode.decode(encoded_str)
          [command | _] ->
              IO.puts("Unknown command: #{command}")
              System.halt(1)
          [] ->
              IO.puts("Usage: your_bittorrent.sh <command> <args>")
              System.halt(1)
      end
  end
end

defmodule Bencode do
    def decode(encoded_value) when is_binary(encoded_value) do
        binary_data = :binary.bin_to_list(encoded_value)
        case Enum.find_index(binary_data, fn char -> char == 58 end) do
          nil ->
            IO.puts("The ':' character is not found in the binary")
          index ->
            rest = Enum.slice(binary_data, index+1..-1)
            rest_str = List.to_string(rest)
            json_encoded = Jason.encode!(rest_str)
            IO.puts(json_encoded)
        end
      end

    def decode(_), do: "Invalid encoded value: not binary"
end


