#!/usr/bin/env python
from libbe.cmdutil import *
from libbe.bugdir import tree_root, create_bug_dir
from libbe import names
import sys
import os
import becommands.severity
import becommands.list
import becommands.show
import becommands.set_root
import becommands.new
import becommands.close
import becommands.open
__doc__ = """Bugs Everywhere - Distributed bug tracking

Supported becommands
 set-root: assign the root directory for bug tracking
      new: Create a new bug
     list: list bugs
     show: show a particular bug
    close: close a bug
     open: re-open a bug
 severity: %s

Unimplemented becommands
  comment: append a comment to a bug
""" % becommands.severity.__desc__



if len(sys.argv) == 1:
    print __doc__
else:
    try:
        try:
            cmd = {
                "list": becommands.list.execute,
                "show": becommands.show.execute,
                "set-root": becommands.set_root.execute,
                "new": becommands.new.execute,
                "close": becommands.close.execute,
                "open": becommands.open.execute,
                "severity": becommands.severity.execute,
            }[sys.argv[1]]
        except KeyError, e:
            raise UserError("Unknown command \"%s\"" % e.args[0])
        cmd(sys.argv[2:])
    except UserError, e:
        print e
        sys.exit(1)