# hyprcwd
xcwd for Hyperland.

## Dependencies
- `hyprland` obviously
- `jq` for parsing hyprctl output

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


## Performance gains that no one asked for
Some brave soul decided my humble script wasn't Fast or Safe enough and rewrote it in Rust™. You can check it out [here](https://github.com/JonnieCache/hyprcwd-rs).
