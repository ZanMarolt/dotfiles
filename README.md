# .dotfiles

HereBe my dotfiles.

## Installation

### Word of advice

If you are not me, you may want to reconsider installing this repository directly. Many settings are specific to my environment, at least review them before applying them anywhere.

### Actual installation (if you are me)

Simply clone the repository to your favourite location, for example:

```shell
git clone https://github.com/davidkuridza/dotfiles.git ~/.dotfiles
~/.dotfiles/bootstrap.sh
~/.dotfiles/bin/dotfiles --all
```

## How does it work?

### Tree structure

```
.
├── bin
│   └── ... <-- executable scripts
├── custom
│   ├── bin
│   ├── dots
│   └── provision.sh
├── dots
│   └── ... <-- actual dotfiles
├── Brewfile
├── Caskfile
├── Gofile
├── Masfile
├── bootstrap.sh
└── macos.sh
```

### dots

All the files and directories starting with a `.` are symlinked to `$HOME`.

### Brewfile, Caskfile

Each file contains a list of packages to be installed with `brew`, `brew cask` respectively.

## License

Licensed under the [MIT license](LICENSE).
