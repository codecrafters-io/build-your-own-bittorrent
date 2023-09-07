import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
// import com.fasterxml.jackson.databind.ObjectMapper;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonParser;

// JBANG SUPPORT
///usr/bin/env jbang "$0" "$@" ; exit $?
//JAVA 17
//DEPS com.fasterxml.jackson.core:jackson-databind:2.14.2
//DEPS com.google.code.gson:gson:2.10.1
//SOURCES **.java

public class Main {
  // private static final ObjectMapper objectMapper = new ObjectMapper();
  private static final Gson gson = new Gson();
  public static void main(String[] args) throws Exception {
    String command = args[0];
    if("decode".equals(command)) {
       String bencodedValue = args[1];
       String decoded;
       try {
         decoded = decodeBencode(bencodedValue);
       } catch(RuntimeException e) {
         System.out.println(e.getMessage());
         return;
       }
       //System.out.println(objectMapper.writeValueAsString(decoded));
       System.out.println(gson.toJson(decoded));

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
