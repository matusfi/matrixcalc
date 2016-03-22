module Paths_matrixcalc (
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

bindir     = "/home/matus/code/matrixcalc/.stack-work/install/x86_64-linux/lts-5.8/7.10.3/bin"
libdir     = "/home/matus/code/matrixcalc/.stack-work/install/x86_64-linux/lts-5.8/7.10.3/lib/x86_64-linux-ghc-7.10.3/matrixcalc-0.1.0.0-HwLmQRBThLXJcxovqXtkOW"
datadir    = "/home/matus/code/matrixcalc/.stack-work/install/x86_64-linux/lts-5.8/7.10.3/share/x86_64-linux-ghc-7.10.3/matrixcalc-0.1.0.0"
libexecdir = "/home/matus/code/matrixcalc/.stack-work/install/x86_64-linux/lts-5.8/7.10.3/libexec"
sysconfdir = "/home/matus/code/matrixcalc/.stack-work/install/x86_64-linux/lts-5.8/7.10.3/etc"

getBinDir, getLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "matrixcalc_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "matrixcalc_libdir") (\_ -> return libdir)
getDataDir = catchIO (getEnv "matrixcalc_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "matrixcalc_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "matrixcalc_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
