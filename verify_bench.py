import os
import glob
import sys
from utils import can_run_command
from datapath import DatapathDataSet


def main():

    # Preprocessing checks
    requirements = ["circt-synth", "circt-verilog"]
    for req in requirements:
        if not can_run_command(req):
            print(f"Error: Required command '{req}' is not available. Please install it and ensure it's in your PATH.")
            sys.exit(1)

    if len(sys.argv) < 2:
        print("Error: No bitwidth specified")
        print("Usage: python eval_bench.py <integer> [directory]")
        sys.exit(1)

    bw = sys.argv[1]
    if not bw.isdigit():
        print("Error: Bitwidth must be a positive integer")
        sys.exit(1)

    if len(sys.argv) >= 3:
        dirs = [sys.argv[2]]
    else:
        dirs = [d for d in glob.glob("benchmarks/*/") if os.path.isdir(d)]

    print_header = True
    # Create output directory
    output_dir = f"output"
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    for dir in dirs:
        dir = dir.rstrip('/')
        dir = dir.replace("benchmarks/", "")

        # Comb Comparison - lower compress to tree - pass to yosys
        datapath = DatapathDataSet("datapath", dir, output_dir, bw)
        datapath.generate_smtlib()
        # datapath.run_z3()
        
        if print_header:
            print_header = False
            top_row = f"{'':<20} | {datapath.name.upper():^{len(datapath.print_header())}} "
            print(top_row)
            print(f"{'':<20} | {datapath.print_header()} ")
            print(f"{'-'*20}-+-{'-'*len(datapath.print_header())}-")

        print(f"{dir:<20} | {datapath.print_string()} ")

if __name__ == "__main__":
    main()