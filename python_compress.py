#!/usr/bin/python2.7

import tarfile
import time


timestamp = time.strftime("%Y%m%d-%H%M")
filename = timestamp + "-" + "duckie" + ".tar.gz"

tar = tarfile.open(filename, "w:gz")
for name in [ "blacklist.sh" ]:
    tar.add(name)
tar.close()
