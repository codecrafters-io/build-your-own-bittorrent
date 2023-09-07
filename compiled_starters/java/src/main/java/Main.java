import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import com.fasterxml.jackson.databind.ObjectMapper;

///usr/bin/env jbang "$0" "$@" ; exit $?
//JAVA 17
//DEPS com.fasterxml.jackson.core:jackson-databind:2.14.2
//SOURCES **.java

public class Main {
  private static final ObjectMapper objectMapper = new ObjectMapper();
  public static void main(String[] args) throws Exception {
    // You can use print statements as follows for debugging, they'll be visible when running tests.
    System.out.println("Logs from your program will appear here!");
    String command = args[0];
    if("decode".equals(command)) {
      //  Uncomment this block to pass the first stage
      //  String bencodedValue = args[1];
      //  String decoded;
      //  try {
      //    decoded = decodeBencode(bencodedValue);
      //  } catch(RuntimeException e) {
      //    System.out.println(e.getMessage());
      //    return;
      //  }
      //  System.out.println(objectMapper.writeValueAsString(decoded));

    } else {
      System.out.println("Unknown command: " + command);
    }

  }

  static String decodeBencode(String bencodedString) {
    if (Character.isDigit(bencodedString.charAt(0))) {
      int firstColonIndex = 0;
      for(int i = 0; i < bencodedString.length(); i++) { 
        if(bencodedString.charAt(i) == ':') {
          firstColonIndex = i;
          break;
        }
      }
      int length = Integer.parseInt(bencodedString.substring(0, firstColonIndex));
      return bencodedString.substring(firstColonIndex+1, firstColonIndex+1+length);
    } else {
      throw new RuntimeException("Only strings are supported at the moment");
    }
  }
  
}
