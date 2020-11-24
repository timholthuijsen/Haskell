{-# LANGUAGE CPP #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
{-# OPTIONS_GHC -fno-warn-implicit-prelude #-}
module Paths_assignment7 (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/tim/.cabal/bin"
libdir     = "/home/tim/.cabal/lib/x86_64-linux-ghc-8.0.2/assignment7-0.1.0.0"
dynlibdir  = "/home/tim/.cabal/lib/x86_64-linux-ghc-8.0.2"
datadir    = "/home/tim/.cabal/share/x86_64-linux-ghc-8.0.2/assignment7-0.1.0.0"
libexecdir = "/home/tim/.cabal/libexec"
sysconfdir = "/home/tim/.cabal/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "assignment7_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "assignment7_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "assignment7_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "assignment7_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "assignment7_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "assignment7_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
