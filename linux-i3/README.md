## Linux configurations

`OS`: Fedora 41 i3

`Status`: :work-in-progress:


for the changes in the font from gtk-3.0

~/.config/gtk-3.0/settings.ini

```bash
flatpak override --user --env=__NV_PRIME_RENDER_OFFLOAD=1 com.obsproject.Studio
flatpak override --user --env=__GLX_VENDOR_LIBRARY_NAME=nvidia com.obsproject.Studio\n
```

