# macOS Setup

## Introduction

This repository is used to install macOS on machines at home. The following
are implemented:

* **macOS & Software Defaults**: Updating of plist properties for various
  aspects of macOS and software configuration.  The plist module comes
  from [fgimian's Mac Build](https://github.com/fgimian/macbuild).
* **Homebrew Package and Cask Management**: This is courtesy of [Jeff
  Geerling's homebrew ansible role](https://github.com/geerlingguy/ansible-role-homebrew)
* **Desktop Application Installation**: This is courtesy of [Jeff
  Geerling's mas ansible role](https://github.com/geerlingguy/ansible-role-mas)
* **Dotfile Installation**: This is courtesy of [Jeff Geerling's dotfiles
  ansible role](https://github.com/geerlingguy/ansible-role-dotfiles)
* **Dock Configuration**: Automatic configuration of the Dock using
  [dockutil](https://github.com/kcrawford/dockutil).
* **Startup Item Setup**: Startup items are added via
  [loginitems](https://github.com/OJFord/loginitems).

## Quick Start

Run the following in terminal:

```bash
git clone https://github.com/patsoffice/ansible-mac-setup.git
cd ~/ansible-mac-setup
./bootstrap.sh
./mac-setup.sh
```

## Follow-up Tasks

The following tasks must be performed manually as I have yet to find a way to
automate them.

### Follow-up Installation & Configuration (macOS)

* **Finder**: Setup sidebar containing favourites

## License

macOS Setup is released under the **MIT** license. Please see the
[LICENSE](https://github.com/fgimian/macbuild/blob/master/LICENSE) file for
more details.  Feel free take what you like and use it in your own Ansible
scripts.