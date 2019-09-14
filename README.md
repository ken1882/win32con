# win32con
A simple gem defines windows constants

## Install
Just do `gem install win32con`

Note that this gem should be used with Win32API, or Win32::API if you're using [cosmo0920's win32-api](https://github.com/cosmo0920/win32-api).</br>
With this gem now you don't have to worry about those tricky windows constants.


## Examples
Simulate a left-mouse click
```ruby
require 'win32/api'
require 'win32con'

MouseEvent = Win32::API.new('mouse_event', 'LLLLL', 'V', 'user32')
MouseEvent.call(Win32CON::MOUSEEVENTF_LEFTDOWN, 0, 0, 0, 0)
sleep(0.1)
MouseEvent.call(Win32CON::MOUSEEVENTF_LEFTUP, 0, 0, 0, 0)
```

A 'Hello World!' auto-typer:
```ruby
require 'win32/api'
require 'win32con'
require 'win32con/keymap'

include Win32CON

KeyBDEvent = Win32::API.new('keybd_event', 'LLLP', 'V', 'user32')

# type a key on keyboard
def trigger_key(*kcodes)
  kcodes.each do |k|
    # key down
    KeyBDEvent.call(k, 0, KEYEVENTF_EXTENDEDKEY, 0)
  end
  sleep(0.01)
  kcodes.each do |k|
    # key up
    KeyBDEvent.call(k, 0, KEYEVENTF_EXTENDEDKEY | KEYEVENTF_KEYUP, 0)
  end
end

# Input sequence of `Hello World!`
sequence = [
  [VK_SHIFT, Keymap[:vk_H]],
  Keymap[:vk_E],
  Keymap[:vk_L],
  Keymap[:vk_L],
  Keymap[:vk_O],
  Keymap[:vk_space],
  [VK_SHIFT, Keymap[:vk_W]],
  Keymap[:vk_O],
  Keymap[:vk_R],
  Keymap[:vk_L],
  Keymap[:vk_D],
  [VK_SHIFT, Keymap[:vk_1]],
]

sequence.each do |keys|
  trigger_key(*keys)
end
```
