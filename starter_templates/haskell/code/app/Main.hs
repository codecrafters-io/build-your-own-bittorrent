{-# LANGUAGE BlockArguments #-}
{-# LANGUAGE OverloadedStrings #-}    
import Data.Aeson
import Data.ByteString.Char8 (ByteString)
import Data.Char (isDigit)
import System.Environment
import System.Exit
import qualified Data.ByteString.Char8 as B
import qualified Data.ByteString.Lazy as LB
import System.IO (hPutStrLn, hSetBuffering, stdout, stderr,  BufferMode (NoBuffering))

decodeBencodedValue :: ByteString -> ByteString
decodeBencodedValue encodedValue
    | isDigit (B.head encodedValue) =
        case B.elemIndex ':' encodedValue of
            Just colonIndex -> B.drop (colonIndex + 1) encodedValue
            Nothing -> error "Invalid encoded value"
    | otherwise = error $ "Unhandled encoded value: " ++ B.unpack encodedValue

main :: IO ()
main = do
    -- Disable output buffering
    hSetBuffering stdout NoBuffering
    hSetBuffering stderr NoBuffering

    args <- getArgs
    if length args < 2
        then do 
            putStrLn "Usage: your_program.sh <command> <args>"
            exitWith (ExitFailure 1)
        else return ()

    let command = args !! 0
    case command of
        "decode" -> do
            -- You can use print statements as follows for debugging, they'll be visible when running tests.
            hPutStrLn stderr "Logs from your program will appear here!"
            -- Uncomment this block to pass stage 1
            -- let encodedValue = args !! 1
            -- let decodedValue = decodeBencodedValue(B.pack encodedValue)
            -- let jsonValue = encode(B.unpack decodedValue)
            -- LB.putStr jsonValue
            -- putStr "\n"
        _ -> putStrLn $ "Unknown command: " ++ command
