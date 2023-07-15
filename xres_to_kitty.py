#!/usr/bin/env python3

from sys import stdin, stdout
import re

params = ["color", "cursor_color", "foreground", "background"]

in_conf = stdin.read()

text = in_conf
text = re.sub('!', '#', text)
text = re.sub('\*.', '', text)
text = re.sub(':', '', text)
text = re.sub('kitty.', '', text)
#text = '\n'.join(filter((lambda a: (a.startswith(x) for x in params)), text.splitlines()))
text = '\n'.join(filter(lambda a: any(a.startswith(c) for c in params), text.splitlines()))

stdout.write(text)
