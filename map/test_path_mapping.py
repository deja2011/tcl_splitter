# coding=utf-8

"""
Unit tests of generate_file_mapping.generate_file_mapping.
"""

import unittest
from itertools import count
from os.path import isfile
from os import unlink

from generate_path_mapping import generate_path_mapping


class NameSpace(object):
    """
    A simple namespace object.
    """
    pass


class FileMappingTestCase(unittest.TestCase):
    """
    Unit tests
    """

    def test_generate_file_mapping(self):
        """
        Test if generate_path_mapping.generate_path_mapping works correctly.
        """
        print()
        for i in count(start=1, step=1):
            input_file = "test/input.{}.txt".format(i)
            ref_file = "test/output.{}.txt".format(i)
            if not isfile(input_file):
                break
            print("Unittest on {} ... ".format(input_file))
            output_file = "temp.txt"
            if isfile(output_file):
                unlink(output_file)
            args = NameSpace()
            args.source_tree = input_file
            args.output = output_file
            args.suffix = "CONSTRAINT/scripts"
            generate_path_mapping(args)
            output = open(output_file)
            ref = open(ref_file)
            self.assertEqual(output.read(), ref.read())
            output.close()
            ref.close()


if __name__ == "__main__":
    unittest.main()
