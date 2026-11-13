# hyprcwd

xcwd for Hyprland.


## Dependencies

- `hyprland` obviously
- `jq` — processes hyprctl output
- `procps-ng` — provides ps
- `awk` — processes the process snapshot
- `coreutils` — provides readlink
- `bash` — runs the script


## Install

```bash
yay -S hyprcwd-git
```

or

```bash
git clone https://github.com/vilari-mickopf/hyprcwd.git
cd hyprcwd
sudo make install
```


## Usage

```
hyprcwd [-f|--follow-job]
  -f, --follow-job  Prefer the foreground job's cwd over the terminal session's cwd.
```

`--follow-job` can be used if you have a long-running process running in for example `/tmp`, and you want to open a new terminal in that location, you can use `hyprcwd --follow-job` and get `/tmp` instead of shell's directory.
Similarly, if you launch nvim and then change its working directory manually or through a session plugin such as startify, the flag returns nvim's updated directory instead of the directory it was launched from. In case of terminals spawned inside of nvim (with `:terminal`), the inner terminal has its own tty and the script selects the outer terminal session first and doesn't detect which nvim buffer is active.

Useful bindings for `hyprland.lua` (change `ghostty` to your terminal of choice):

```lua
hl.bind(
    mod .. ' + RETURN',
    hl.dsp.exec_cmd('ghostty --working-directory="$(hyprcwd)"')
)

hl.bind(
    mod .. ' + SHIFT + RETURN',
    hl.dsp.exec_cmd('ghostty --working-directory="$(hyprcwd --follow-job)"')
)
```


## Limitations

- When multiple terminal tabs/windows share one PID, the script cannot determine which is active. It selects the first matching terminal session in breadth-first order, which may belong to an inactive tab/window.


## Performance gains that no one asked for

Some brave soul decided my humble script wasn't Fast or Safe enough and rewrote it in Rust™. You can check it out [here](https://github.com/JonnieCache/hyprcwd-rs).
