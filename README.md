# Kickstart that sh*t!

Personal list of must-have packets, scripts that i am sick and tired of re-installing.

## Running methods
> Do you trust me enough to run as root?

1. One liner that downloads tarball from github, untars and executes it

    ```
    wget -O unix-kickstart.tar.gz https://github.com/kirstein/unix-kickstart/tarball/master && tar -xvf unix-kickstart.tar.gz && cd kirstein-unix-kickstart* && sudo chmod +x kickstart.sh && sudo ./kickstart.sh
    ```

2. Clone from git

    ```
    git clone git@github.com:kirstein/unix-kickstart.git
    cd unix-kickstart
    sudo chmod +x kickstart.sh
    sudo sh kickstart.sh
    ```

## Logic

Sequence of steps that this magnificent bastard takes:

1. installs all packages from 'packages' file
2. initiates all '*.sh' files in 'scripts' directory
3. ???
4. profit.

### Enjoy!