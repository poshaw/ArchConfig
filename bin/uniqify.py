#! /usr/bin/python
# -*- conding: utf-8 -*-

""" removes duplicate lines from a file

changed so now uniqify deletes entries from the beginning
so the last entries will remain at the end

add the following line to .bashrc to make .bash_history behave:
python3 ~/bin/uniqify.py --infile=~/.bash_history
"""

__author__ = "Phil Shaw"
__copyright__ = "Copyright 2019, Phil Shaw"
__credits__ = [__author__]
__license__ = "GPL"
__version__ = "1.0.0"
__maintainer__ = "Phil Shaw"
__email__ = "poadshaw@gmail.com"
__status__ = "Production"

import argparse
import locale
import os
import re
import sys
from pathlib import Path

def uniqify(seq, idfun=None):
	if idfun is None:
		def idfun(x): return x
	seq.reverse()
	seen = {}
	result = []
	for item in seq:
		marker = idfun(item)
		# remove duplicate entries
		if marker in seen:
			continue
		if re.search('^\s', marker):
			continue
		seen[marker] = 1
		result.append(item)
	result.reverse()
	return result

def run_tests(args):
	"""runs tests on methods

	usage:
	$ ~/bin/u/b.py -tv --infile=~/bin/u/uniq.txt --outfile=~/bin/u/uniq_out.txt
	"""
	if args.verbose >= 1:
		print("running tests on {}".format(os.path.basename(__file__)))
	infile=Path(os.path.expanduser(args.infile))
	# if args.outfile is not specified, set outfile to infile
	# note: this will overwright args.infile
	if args.outfile is None:
		outfile=Path(os.path.expanduser(args.infile))
	else:
		outfile=Path(os.path.expanduser(args.outfile))
	print("you want to open: {}".format(infile))
	print("you want to write to: {}".format(outfile))
	if args.verbose >= 1:
		print("tests completed on {}".format(os.path.basename(__file__)))
	return 0

def main(args):
	"""main() is run when running this file directly

	This method is used to run the program
	"""
	my_encoding = locale.getpreferredencoding()
	# handle command line arguments
	parser = argparse.ArgumentParser(description='{}'.format(__doc__))
	parser.add_argument("-v", "--verbose", action="count", default=0,
			help="increase output verbosity")
	parser.add_argument("-t", "--tests", action='store_true')
	parser.add_argument("-i", '--infile', help="input filename", metavar='FILE',
			required=True)
	parser.add_argument("-o", '--outfile',
			help="output filename", metavar='FILE')
	parser.add_argument('--version', action='version',
			version='{} {}'.format(os.path.basename(__file__), __version__))
	args = parser.parse_args()

	# to run tests enter file.py --tests
	if args.tests:
		return run_tests(args)

	infile=Path(os.path.expanduser(args.infile))
	# if args.outfile is not specified, set outfile to infile
	# note: this will overwright args.infile
	if args.outfile is None:
		outfile=Path(os.path.expanduser(args.infile))
	else:
		outfile=Path(os.path.expanduser(args.outfile))
	try:
		with infile.open(mode='r') as file:
			L = file.readlines()
		old_length = len(L)
		L = uniqify(L)
		new_length = len(L)
		with outfile.open(mode='w') as file:
			for line in L:
				file.write(line)
		#print("you cut out {} lines from {}".format(old_length - new_length, infile))
	except FileNotFoundError:
		print("file: {} not found".format(infile))
	return 0

if __name__ == "__main__":
	sys.exit(main(sys.argv[1:]))
