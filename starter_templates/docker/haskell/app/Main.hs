{-# LANGUAGE OverloadedStrings #-}
module Main where

import System.Process
import System.Environment
import System.Exit

main :: IO ()
main = do
    putStrLn "Your code goes here"

    -- Uncomment this to pass stage 1
    -- args <- getArgs
    -- h <- spawnCommand (unwords $ drop 3 args)
    -- xc <- waitForProcess h
    -- exitWith xc
