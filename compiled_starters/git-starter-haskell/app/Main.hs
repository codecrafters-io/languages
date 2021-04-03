{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Directory
import System.Environment
import System.IO

main :: IO ()
main = do
    putStrLn "Your code goes here"

    -- Uncomment this to pass stage 1
    -- args <- getArgs
    -- let command = args!!1
    -- putStrLn command
    -- if command == "init"
    --   then do
    --     createDirectory ".git"
    --     createDirectory ".git/objects"
    --     createDirectory ".git/refs"
    --     headFile <- openFile ".git/HEAD" WriteMode
    --     hPutStrLn headFile "ref: refs/heads/master"
    --     hClose headFile
    --     putStrLn "Initialized git directory"
    -- else error $ "Unknown command" ++ command
    -- return ()

