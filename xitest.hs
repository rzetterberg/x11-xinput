
import Graphics.X11

import XInput

withDisplay :: String -> (Display -> IO a) -> IO ()
withDisplay str action = do
  dpy <- openDisplay str
  action dpy
  closeDisplay dpy

main = do
  withDisplay ":0" $ \dpy -> do
    xinput <- xinputInit dpy
    print xinput