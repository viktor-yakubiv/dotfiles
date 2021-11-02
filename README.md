# Dotfiles

> Your dotfiles are how you personalize your system. These are mine.
>
> _— @holman_

My dotfiles represent the way I work.
Once, I’ve been tired of setting everything up after re-installing the OS
and decided I need such a repository that would do it for me
when I could have a cup of ☕️. Here it is!


## Components 📦

There's a few special files in the hierarchy.

- **bin/**:
  Anything in `bin/` is added to `$PATH`
  and is made available everywhere.
- **topic/\*.zsh**:
  Any files ending with `.zsh` get loaded into environment.
- **topic/path.zsh**:
  Any file named `path.zsh` is loaded first
  and is expected to setup `$PATH` or similar.
- **topic/completion.zsh**:
  Any file named `completion.zsh` is loaded last
  and is expected to setup autocomplete.
- **topic/install.sh**:
  Any file named `install.sh` is executed
  when you run `script/install`.
  To avoid being loaded automatically,
  its extension is `.sh`, not `.zsh`.
- **topic/\*.symlink**:
  Any file ending in `*.symlink` gets symlinked into `$HOME`.


## Install ⬇️

Run this:

```sh
git clone https://github.com/viktor-yakubiv/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
.bin/bootstrap
```

This will symlink the appropriate files in `.dotfiles` to home directory.
Everything is configured and tweaked within `~/.dotfiles`.


## Thanks ❤️

I am inspired by [@holman's dotfiles](https://github.com/holman/dotfiles)
and reused everything I could
but left a bit of touch of my own personality.

Thanks a lot!
