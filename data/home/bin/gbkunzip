#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
unzip3_gbk.py: Deal with zip files using encoding GB2312/GBK/GB18030
"""

import os
# import sys
import argparse
import zipfile
# import copy
import datetime


class GBKZipFile(zipfile.ZipFile):
    """Class with methods to list, extract zip files using encoding GB18030."""
    def __init__(self, filename):
        super().__init__(filename, mode='r')
        # self.filelist_old = copy.deepcopy(self.filelist)
        # self.NameToInfo_old = copy.deepcopy(self.NameToInfo)
        self.NameToInfo = {}
        for zinfo in self.filelist:
            zinfo.filename = zinfo.filename.encode('cp437').decode('gb18030')
            self.NameToInfo[zinfo.filename] = zinfo

    @staticmethod
    def print_bold(text):
        """Print bold text."""
        bold = '\033[1m'
        endc = '\033[0m'
        print(bold + text + endc)

    def pprintdir(self):
        """Print a table of contents of the zip files more elegantly."""
        self.print_bold('Archive:  ' + os.path.basename(self.filename))
        if self.comment:
            self.print_bold('Comment:  ' + self.comment.decode('gb18030'))
        print('{:^10}  {:^19}  {}'.format('Size', 'Modified', 'File Name'))
        print('{:=^10}  {:=^19}  {:=<11}'.format('', '', ''))
        size_sum = 0
        for zinfo in self.filelist:
            filename = zinfo.filename
            filetime = '{:%Y-%m-%d %H:%M:%S}'.format(
                datetime.datetime(*zinfo.date_time))
            print('{:>10}  {}  {}'.format(zinfo.file_size, filetime, filename))
            size_sum += zinfo.file_size
        file_sum = len(self.filelist)
        print('{:-^10}  {:^19}  {:-^11}'.format('', '', ''))
        print('{:>10}  {:^19}  {}'.format(str(size_sum), '',
                                          str(file_sum) + ' files'))


def cenc(name):
    """Check if it's not None and encode."""
    return name is not None and name.encode() or None


class MyParser(argparse.ArgumentParser):
    """Paring command line options."""
    def __init__(self, prog=None):
        description = 'Extract files from zipfiles using encoding GBK'
        super().__init__(prog=prog,
                         description=description)
        self.add_argument('zipfile', nargs='+')
        self.add_argument('-l', '--list', action='store_true', dest='islist',
                          help='list files in zipfiles')
        self.add_argument('-o', '--outdir', dest='outdir',
                          help='set output directory')
        self.add_argument('-p', '--password', dest='password',
                          help='set password')


def main():
    """Parse argument, list or extract zip files."""
    myparser = MyParser()
    args = myparser.parse_args()

    if args.islist:
        for zfile in args.zipfile:
            with GBKZipFile(zfile) as zfp:
                if args.password:
                    zfp.setpassword(cenc(args.password))
                zfp.pprintdir()
    else:
        for zfile in args.zipfile:
            with GBKZipFile(zfile) as zfp:
                zfp.extractall(path=args.outdir, pwd=cenc(args.password))


if __name__ == '__main__':
    main()
