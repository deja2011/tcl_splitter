#!/depot/Python-3.5.0/bin/python3
# coding=utf-8

"""
Build PRS directory from run directory of original testcase, with prelude enabled.
"""


import argparse
import logging
import os




def main(args):
    """
    Main function
    """
    logging.error("Hello World!")
    logging.error(args.run_dir)
    logging.error(args.output_dir)
    logging.error(os.getcwd())





if __name__ == "__main__":
    PARSER = argparse.ArgumentParser()
    PARSER.add_argument('-r', '--run_dir', required=True)
    PARSER.add_argument('-o', '--output_dir', required=True)
    PARSER.set_defaults(func=main)
    ARGS = PARSER.parse_args()
    ARGS.func(ARGS)


