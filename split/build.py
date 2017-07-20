#!/depot/Python-3.5.0/bin/python3
# coding=utf-8

"""
Build PRS directory from run directory of original testcase, with prelude enabled.
"""


import argparse
# import logging
# import os
import sys

from source_tree import Flow


def build_dir(args):
    """
    Build PRS design directory.
    """
    flow = Flow(source_tree_file=args.source_tree,
                separator_file=args.separators,
                mapping_file=args.mapping)
    flow.build(args.output)


def main(*args):
    """
    main function for argument parsing.
    """
    parser = argparse.ArgumentParser()
    parser.add_argument('-t', '--source_tree',
                        help="specify path to source tree file.",
                        required=True)
    parser.add_argument('-s', '--separators',
                        help="specify path to separators file.",
                        required=True)
    parser.add_argument('-m', '--mapping',
                        help="specify path to path mapping file.",
                        required=True)
    parser.add_argument('-o', '--output',
                        help="specify path to output directory. "
                        "Output directory is equivalent to DCRT_user_data "
                        "or DC_user_data",
                        required=True)
    parser.add_argument('-f', '--force', action='store_true',
                        help="force to remove output directory if it exists.")
    parser.add_argument('--suffix', default="CONSTRAINT/scripts",
                        help="relative path to non-PRS-interfaced scripts."
                        "Defaults to CONSTRAINT/scripts.")
    parser.set_defaults(func=build_dir)
    args = parser.parse_args()
    args.func(args)


if __name__ == "__main__":
    main(sys.argv[1:])
