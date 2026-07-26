-- | Defines keyboard scancodes.
--
--     Please refer to the Best Keyboard Practices document for details on what this information means and how best to use it.
--
--     [https:\/\/wiki.libsdl.org\/SDL3\/BestKeyboardPractices](https://wiki.libsdl.org/SDL3/BestKeyboardPractices) The SDL keyboard scancode representation.
--
--     An SDL scancode is the physical representation of a key on the keyboard, independent of language and keyboard mapping.
--
--     Values of this type are used to represent keyboard keys, among other places in the @scancode@ field of the SDL_KeyboardEvent structure.
--
--     The values in this enumeration are based on the USB usage page standard: [https:\/\/usb.org\/sites\/default\/files\/hut1_5.pdf](https://usb.org/sites/default/files/hut1_5.pdf)
--
--     @since 3.2.0
--
--     == FFI conventions
--
--     Unsuffixed aliases are __unsafe__ foreign imports; aliases suffixed @Safe@ are safe. Functions whose callbacks fire during the call export only the Safe alias (the genuine unsafe import stays reachable under @SDL3.Sys.Bindgen.Scancode.Unsafe@); functions curated unsafe-only export only the unsuffixed one. Each alias\'s documentation records its flavor and rationale.
--
--     Full conventions: "SDL3.Sys".
module SDL3.Sys.Scancode (
  module SDL3.Sys.Bindgen.Scancode,
)
where

import SDL3.Sys.Bindgen.Scancode
