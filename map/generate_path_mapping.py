#!/depot/Python-3.5.0/bin/python3
# coding=utf-8

"""
Generate directory path mapping file from source tree file in prelude.
"""


import sys
import argparse
from os.path import basename, dirname
from os.path import join as opjoin


def generate_path_mapping(args):
    """
    Parse source tree file, generate mapping hash, export mapping file.
    """
    mapping = dict()
    fin = open(args.source_tree)
    next(fin)
    for line in fin:
        dir_path = dirname(line.split()[1])
        dir_name = basename(dir_path)
        if dir_path in mapping:
            continue
        elif dir_name in mapping.values():
            count = 1
            while True:
                suffixed = "{}.{}".format(dir_name, count)
                if suffixed not in mapping.values():
                    mapping[dir_path] = suffixed
                    break
                count += 1
        else:
            mapping[dir_path] = dir_name
    if len(mapping) == 1:
        mapping = {k : args.suffix for k in mapping.keys()}
    else:
        mapping = {k : opjoin(args.suffix, v) for k, v in mapping.items()}
    fout = open(args.output, 'w')
    fout.write('\n'.join(
        ["{} {}".format(k, mapping[k]) for k in sorted(mapping.keys())]))
    fout.write('\n')
    fin.close()
    fout.close()




def main(*args):
    """
    main function for argument parsing.
    """
    parser = argparse.ArgumentParser
    parser.add_argument('-s', '--source_tree',
                        help="specify path to source tee file.",
                        required=True)
    parser.add_argument('-o', '--output',
                        help="specify path to generate path maping file.",
                        required=True)
    parser.add_argument('-f', '--force', action='store_true',
                        help="force to rewrite mapping file if it exists.")
    parser.add_argument('--suffix', default="CONSTRAINT/scripts",
                        help="relative path to non-PRS-interfaced scripts.")
    parser.set_defaults(func=generate_path_mapping)
    args = parser.parse_args(args)
    args.func(args)


if __name__ == "__main__":
    main(sys.argv[1:])
