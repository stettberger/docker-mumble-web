#!/usr/bin/python3

import os
import sys
from jinja2 import Environment, FileSystemLoader


def main(src, dst):
    if os.path.exists(dst):
        print(f"File exists, do not overwrite: {dst}")
    else:
        print(f"Generating config from template: {dst}")
        env = Environment(loader=FileSystemLoader("/context/"))
        template = env.get_template(src)

        with open(dst, 'w+') as fh:
            fh.write(template.render(**os.environ))

if __name__ == "__main__":
   sys.exit(main(sys.argv[1], sys.argv[2]))
