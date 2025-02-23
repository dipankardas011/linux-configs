Using about:config Settings in Firefox
Firefox also has several settings within the about:config page that can enable or disable hardware acceleration:

layers.acceleration.force-enabled – Forces hardware acceleration.
gfx.direct2d.disabled – Disable Direct2D hardware acceleration (should be false for Nvidia hardware).
gfx.webrender.all – Enables WebRender, which uses the GPU for rendering when available.

```conf
/usr/share/applications/org.mozilla.firefox.desktop
Exec=env __NV_PRIME_RENDER_OFFLOAD=1 __GLX_VENDOR_LIBRARY_NAME=nvidia firefox
```

