#
# File: test_submission.py
#

import argparse
from project1_py.helpers import test_optimize
from project1_py import optimize

# runs tests on of project1_py

def main():
	parser = argparse.ArgumentParser()
	parser.add_argument("-t", "--test",
					 	choices=["all", "simple1", "simple2", "simple3"],
						required=False,
						default="all")
	parser.add_argument("-n", "--n_trials",
						type=int,
						required=False,
						default=500)
	args = parser.parse_args()
	test_optimize(optimize, args.test, args.n_trials)

if __name__ == '__main__':
	main()
