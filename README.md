**emend** is a Ruby gem that is used to change a computers configuration.
**emend** can clone repositories, create symbolic links, and run commands.
**emend** has been tested with cygwin, linix, linux, and wsl.

## Prerequisites 
1. git client
2. Ruby
3. Ruby gem bundle
4. Ruby gem rake 
5. [emend-computer](https://github.com/Traap/emend-computer) repository has app
(applications) and bundles **emend** knows how to install.  

## Installation
Copy the text below and paste into a shell.  The commands will:
1. Change directory to home
2. Clone Traap/emend
3. Move to emend directory
4. Download dependencies
5. Run unit test
5. Build and install local gem
6. Run emend and display emend's current version.

```bash
$ cd $HOME \
     && git clone http://github.com/Traap/emend.git \
            && cd emend \
            && rake build:emend \ 
            && emend --verbose
```

## Traap/emend-computer
[emend-computer](https://github.com/Traap/emend-computer) repository has app
(applications) and bundles **emend** knows how to install.  

Please do not just run these samples without first inspecting the app or bundle
file.  Use my examples to create ones custom to your liking.

### Install and configure Vim
```bash
emend --verbose --nodryrun --app=vim
```


## YAML Files
### Processing Order
**emend** process YAML files and their contents is the order they are
consumed.  **emdend** 

### Include files
The **includes** link is used to process other YAML files as a logical units.
This example shows using -app, -bundle, and -file.
```
includes:
  - bundle:
    - name: basic 
  - file:
    - name: app/dotfiles/dotfiles.yaml
  - app:
    - name: vim 
```
**Note:** The command below will demonstrates this example without making any
changes to your machine.
```
emend --verbose --file=example/example.yaml
```

### Symbolic Links
The **symlinks** node is used to define a map between a source and target file.
The following example creates two symbolic links.
```
symlinks:
  - symlink:
    - file: ~/git/dotfiles/bash_profile
      link: ~/.bash_profile
      directory: false

    - file: ~/git/dotfiles/bashrc
      link: ~/.bashrc
      directory: false
```

### Clone Repositories
The **repos** node is used to clone git-based repositories to your local
machine.  The example below clones Traap's dotfiles.
```
repos:
  - repo:
    url: http://github.com
    paths:
      - source: Traap/dotfiles
        target: ~/git/dotfiles
```

### Installations
The **installation** node installs programs or runs programs on your local
machine.  The example below is use to install and compile Vim from source code.
Valid name tags are: all, darwin and linux.
```
installations:
 - os:
   - name: darwin
     command:
      - sudo: false
        program: brew
        argument: install Caskroom/cask/xquartz

   - name: any 
     command:
      - sudo: false
        program: brew
        argument: install vim --with-client-server
```

### emend command line
Usage: emend [argv] [options]

Specific options:
    -v, --[no-]verbose               Run verbosely
    -n, --[no-]dryrun                No Dryrun
    -a, --app x,y,z                  App name
    -b, --bundle x,y,z               Bundle name
    -f, --file x,y,z                 File name
    -c, --command-log x              Log commands to file name

Print version and exit.
        --version                    Show version

### --[no]-verbose
Echo commands to system output.

### --[no]-dryrun
By default, **emend** does not modify your computer.  You must explicitly
use the **--no-dryrun** options to cause side effects.  The commands that would
have been executed are echoed to system out.

### --app
A comma-separated list of app names **emend** is to process.  The following
directory and YAML file name convention is mandatory: app/an-app/an-app.yaml.
```
--app=an-app
```

### --bundle
A comma-separated list of bundle names **emend** is to process.  The following
directory and YAML file name convention is mandatory:
bundle/a-bundle/a-bundle.yaml.
```
--bundle a-bundle 
```

### --file
A comma-separated list of file names **emend** is to process.

### --help
Show this message.

### --version
1.3.72 is this the current version.

## Add this function to .bashrc
```bash
EMENDPATH=${HOME}/git/emend
export EMENDPATH

function newcomponent() {
  ${EMENDPATH}/bin/newcomponent $@
}
```

