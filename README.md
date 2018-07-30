# dev-env
Development environment setup in a bootstrapping approach.

Setting up a development environment is boring and time consuming. It's better to eliminate the pain
by automating it with scripts.

# installation
```shell
bash <(curl https://raw.githubusercontent.com/Alexoner/dev-env/master/bootstrap.sh -L)
```

## Backup
1. In the root of the repository
```shell
    lib/backup.sh
```
2. Now the data would have been put in ./data/


## Restore

## Debug if something goes wrong

### Oh-My-Zsh so damn slow

#### Benchmark performance

    $ /usr/bin/time zsh -i -c exit
    3.07 real         1.58 user         1.27 sys

#### Figure out what's slow by printing output

    $ zsh -xv
    +parse_git_dirty:11> STATUS=+parse_git_dirty:11> tail -n1

Run

    $ cd ~/.oh-my-zsh && ag 'tail -n1'
    lib/git.zsh
    23:    STATUS=$(command git status ${FLAGS} 2> /dev/null | tail -n1)

Reading implementation, we found the solution is to set

    git config --global --add oh-my-zsh.hide-dirty 1

## Thanks
- [dev-setup](https://github.com/donnemartin/dev-setup)
