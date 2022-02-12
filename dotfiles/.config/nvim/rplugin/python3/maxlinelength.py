# This is a simple remote vim plugin to limit the size of a line (usefull for
# markdown addicts).
#
# Installation:
#   
#       mkdir -p ~/.config/nvim/rplugin/python3
#       cp maxlinelength.py ~/.config/nvim/rplugin/python3/maxlinelength.py
# 
# Usage:
#
#       It exports a vim command, you can select multiple lines and run
#       ":SplitLine" to adjust your line's length. Just change the "limit"
#       attribute in the class constructor to change you desired line length.
#
import pynvim

@pynvim.plugin
class MaxLineLength(object):

    def __init__(self, nvim):
        self.nvim = nvim
        self.limit = 80

    def split(self, line):
        for c in range(self.limit, 0, -1):
            if line[c] == ' ':
                return line[:c].strip(), line[c:].strip()

    @pynvim.command('SplitLine', nargs='*', range='')
    def fmt(self, args, range):
        buffer = self.nvim.current.buffer
        start, end = range[0] - 1, range[1] - 1
        cursor, progress = start, start
        while progress <= end:
            long = buffer[cursor]
            while len(long) > self.limit:
                short, long = self.split(long)
                buffer.append(short, cursor)
                cursor += 1
            buffer[cursor] = long
            cursor += 1
            progress += 1
