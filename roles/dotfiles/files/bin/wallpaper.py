#!/usr/bin/env python

import random, glob, os

img_list = glob.glob("/home/kinou/Images/background/*")

img = random.sample(img_list, 1)[0]

command = "feh --bg-scale %s" % img

os.system(command)
