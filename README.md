# hyprcwd
xcwd for Hyperland.

## Install
```bash
yay -S hyprcwd-git
```
or
```bash
sudo make install
```

## Usage
```bash
hyprcwd
```

Useful binding for `hyprland.conf`
```
$term = alacritty --working-directory "$(hyprcwd)"
bind = $mod, RETURN, exec, $term
```
