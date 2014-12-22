#!/usr/bin/python

import os, sys
import glob

files = []
files = glob.glob("./*.txt")

print "renaming files..."
for file in files:

    oldfile = file[2:]
    newfile = file[9:]
    os.rename(oldfile,newfile)
    print "renamed", oldfile, "to", newfile

print "...Completed"
