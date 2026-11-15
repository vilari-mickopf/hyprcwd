# hyprcwd

xcwd for Hyprland - Print the working directory of the focused Hyprland window.


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

Use `--follow-job` to return the foreground job's working directory instead of the shell's. For example, if a long-running process is running in `/tmp`, `hyprcwd --follow-job` returns `/tmp`, allowing you to open a new terminal there.

Similarly, if you launch neovim and change its working directory manually or through a session plugin such as startify, the flag returns neovim’s updated directory rather than its launch directory.

Limitation: Terminals opened inside neovim with `:terminal` have their own tty. The script selects the outer terminal session first and cannot detect which neovim buffer is active, so it returns neovim's working directory rather than the inner terminal's.

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
