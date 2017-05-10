#!/usr/bin/env python
# -*- coding: utf-8 -*-

import sys
import time

SPIN = '-\|/'

def main():
    """TODO: Docstring for main.
    :returns: TODO

    """
    i = 0
    while True:
        i = (i + 1) % 4
        sys.stdout.write('{} {}\r'.format(SPIN[i], ' '.join(sys.argv[1:])))
        sys.stdout.flush()
        time.sleep(0.2)
    pass

if __name__ == '__main__':
    main()
