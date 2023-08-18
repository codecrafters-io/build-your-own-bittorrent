use std::env;
use std::io;
use std::process;

enum Value {
    Number(Number),
    String(String),
    Array(Vec<Value>),
    Object(Map<String, Value>),
}

fn decode_bencoded_value(encoded_value: &str) -> Value {
    if pattern.chars().count() == 1 {
        return input_line.contains(pattern);
    } else {
        panic!("Unhandled pattern: {}", pattern)
    }
}

// Usage: your_bittorrent.sh decode "<encoded_value>"
fn main() {
    // You can use print statements as follows for debugging, they'll be visible when running tests.
    println!("Logs from your program will appear here!");

    let args: Vec<String> = env::args().collect();
    let command = args[1];

    if command == "decode" {
        // Decode input
    } else 
        println!("unknown command: {}", args[1])
    }

    // Uncomment this block to pass the first stage
    // let args: Vec<String> = env::args().collect();
    // if args[1] == "init" {
    //     fs::create_dir(".git").unwrap();
    //     fs::create_dir(".git/objects").unwrap();
    //     fs::create_dir(".git/refs").unwrap();
    //     fs::write(".git/HEAD", "ref: refs/heads/master\n").unwrap();
    //     println!("Initialized git directory")
    // } else {
    //     println!("unknown command: {}", args[1])
    // }

    // Uncomment this block to pass the first stage
    // if match_pattern(&input_line, &pattern) {
    //     process::exit(0)
    // } else {
    //     process::exit(1)
    // }
}
