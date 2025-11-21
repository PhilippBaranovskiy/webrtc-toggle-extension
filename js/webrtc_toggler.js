// Disable WebRTC by default.
let isEnabled = true;
toggleWebRTC();

// Handle clicks on the action button.
browser.browserAction.onClicked.addListener(handleClick);

/**
 * Toggles WebRTC on and off.
 * @param {boolean=} enable
 */
function toggleWebRTC(enable = true) {
  // Update setting.
  browser.privacy.network.peerConnectionEnabled.set({ value: enable });
  browser.privacy.network.webRTCIPHandlingPolicy.set({ value: enable ? 'default' : 'disable_non_proxied_udp' });

  // Update title
  browser.browserAction.setTitle({ title: enable ? 'WebRTC is on' : 'WebRTC is off' });

  // Update icon.
  const name = enable ? 'on' : 'off';
  browser.browserAction.setIcon({ path: `images/${name}-64.png` });
}

/** Handles clicks on the action button. */
function handleClick() {
  isEnabled = !isEnabled;
  toggleWebRTC(isEnabled);
}
