#! /usr/bin/env python
from ast import literal_eval
import json
import re
import sys


try:
    input_str = sys.argv[1].strip()
except:
    try:
        input_str = sys.stdin.read().strip()
    except KeyboardInterrupt:
        sys.exit(1)


try:
    parsed = literal_eval(input_str)
except:
    parsed = json.loads(input_str)


pretty = json.dumps(parsed, indent=2)

sys.stdout.write(pretty)
