module Paths_mmaclone (
    version,
    getBinDir, getLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "C:\\Users\\jin\\AppData\\Roaming\\cabal\\bin"
libdir     = "C:\\Users\\jin\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-7.10.2\\mmaclone-0.1.0.0-7qCmVzAeZ7l4QbMWDs7fVL"
datadir    = "C:\\Users\\jin\\AppData\\Roaming\\cabal\\x86_64-windows-ghc-7.10.2\\mmaclone-0.1.0.0"
libexecdir = "C:\\Users\\jin\\AppData\\Roaming\\cabal\\mmaclone-0.1.0.0-7qCmVzAeZ7l4QbMWDs7fVL"
sysconfdir = "C:\\Users\\jin\\AppData\\Roaming\\cabal\\etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "mmaclone_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "mmaclone_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "mmaclone_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "mmaclone_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "mmaclone_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "\\" ++ name)