WebRTC Toggle button for Firefox
========================

WebRTC allows websites to get your actual IP address from behind your VPN.  

This addon allows you to toggle WebRTC off and on at the browser level by one-click button.

Check if your IP address is unhidden: https://browserleaks.com/webrtc

Thanks for being privacy conscious. ✊

## Privacy Policy

This addon collects nothing and sends nothing.

### Note
Some audio/video conferencing web services like Google Meet or Microsoft Teams depend on WebRTC to work. Firefox can't disable WebRTC per-tab or per-window, the setting affects the entire browser. That's why it is a toggler - toggle it on and off to get flexible security solution.

## Development

./build_icons.sh - to generate icons from base files (icon_on.png, icon_off.png)  
./build_xpi.sh - to generate .xpi file

icon.xcf - Gimp icon template (download at https://www.gimp.org/)

----

A fork of original repository authored by Chris Antaki: https://github.com/ChrisAntaki/disable-webrtc-firefox
