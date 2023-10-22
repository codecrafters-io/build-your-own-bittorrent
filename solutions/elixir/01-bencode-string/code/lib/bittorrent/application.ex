# TODO: Use options parser
# TODO: File struture
# TODO: Class naming
# TODO: decode function readability

defmodule Bittorrent.Application do
  use Application

  def start(_type, _args) do      
    args = System.argv()
#    IO.inspect(args)
    case args do
        ["decode" | [encoded_str | _]] ->
            Bencode.decode(encoded_str)
        [command | _] ->
            IO.puts("Unknown command: #{command}")
            System.halt(1)
        [] ->
            IO.puts("Usage: your_bittorrent.sh <command> <args>")
            System.halt(1)
    end
    Supervisor.start_link([], [strategy: :one_for_one, name: Bittorrent.Supervisor])
  end
end

defmodule Bencode do
    def decode(encoded_value) when is_binary(encoded_value) do
        binary = :binary.bin_to_list(encoded_value)
        #IO.inspect(binary)        
        case Enum.find_index(binary, fn char -> char == 58 end) do
          nil ->
            IO.puts("The ':' character is not found in the binary")
          index ->
            rest = Enum.slice(binary, index+1..-1)
            rest_str = List.to_string(rest)
            json_encoded = Jason.encode!(rest_str)
            IO.puts(json_encoded)
        end
      end

    def decode(_), do: "Invalid encoded value: not binary"
end
