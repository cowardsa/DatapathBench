import os
import glob
import sys
import csv
# from tracemalloc import start
import matplotlib.pyplot as plt
import numpy as np

# Defined locally
from utils import can_run_command 
from datapath import DatapathDataSet

################################################################################
# Main Function
################################################################################
# Usage: python3 eval_bench.py <bitwidth> [directory]
def main():
    # Preprocessing checks
    requirements = ["circt-synth", "circt-opt", "circt-translate", "yosys", "abc"]
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
        print("Usage: python eval_bench.py <integer> [directory]")
        sys.exit(1)

    if len(sys.argv) >= 3:
        dirs = [sys.argv[2]]
    else:
        dirs = [d for d in glob.glob("benchmarks/*/") if os.path.isdir(d)]
    
    print_header = True
    names = []
    cells_list = {'comb': [], 'datapath': [], 'yosys': []}
    circt_levels_list = {'comb': [], 'datapath': []}
    area = {'comb': [], 'datapath': [], 'yosys': []}
    delay = {'comb': [], 'datapath': [], 'yosys': []}

    # Create output directory
    output_dir = f"output"
    if not os.path.exists(output_dir):
        os.makedirs(output_dir)

    # Iterate through all benchmark directories        
    for dir in dirs:
        dir = dir.rstrip('/')
        dir = dir.replace("benchmarks/", "")

        names.append(dir)

        # Baseline Yosys - pass bitwidth parameter
        yosys = DatapathDataSet("yosys", dir, output_dir, bw)
        yosys.run_yosys_synth("sv")
        yosys.run_abc_techmapping(area, delay)
        yosys.run_emap_techmapping()
        # Add stats for plotting
        cells_list['yosys'].append(int(yosys.stats['yosys_cells']))
        
        # Baseline circt-synth - disable datapath optimizations
        comb = DatapathDataSet("comb", dir, output_dir, bw)
        comb.run_circt_synth("--disable-datapath")
        comb.run_yosys_synth("aiger")
        comb.run_abc_techmapping(area, delay)
        # comb.run_emap_techmapping()
        # Add stats for plotting
        cells_list['comb'].append(int(comb.stats['yosys_cells']))
        circt_levels_list['comb'].append(int(comb.stats['circt_levels']))

        # Full circt-synth - enable datapath optimizations
        datapath = DatapathDataSet("datapath", dir, output_dir, bw)
        datapath.run_circt_synth()
        datapath.run_yosys_synth("aiger")
        datapath.run_abc_techmapping(area, delay)
        # datapath.run_emap_techmapping()
        # Add stats for plotting
        cells_list['datapath'].append(int(datapath.stats['yosys_cells']))
        circt_levels_list['datapath'].append(int(datapath.stats['circt_levels']))

        if print_header:
            print_header = False
            top_row = f"{'':<20} | {comb.name.upper():^{len(comb.print_header())}} "
            top_row += f"| {datapath.name.upper():^{len(datapath.print_header())}} "
            top_row += f"| {yosys.name.upper():^{len(yosys.print_header())}}"
            print(top_row)
            print(f"{'':<20} | {comb.print_header()} | {datapath.print_header()} | {yosys.print_header()}")
            print(f"{'-'*20}-+-{'-'*len(comb.print_header())}-+-{'-'*len(datapath.print_header())}-+-{'-'*len(yosys.print_header())}")

        print(f"{dir:<20} | {comb.print_string()} | {datapath.print_string()} | {yosys.print_string()}")

        
    
    ############################################################################
    # Tabulation
    ############################################################################
    if len(sys.argv) < 3:
        # Write results to CSV
        csv_file = f"{output_dir}/results_{bw}bit.csv"
        with open(csv_file, "w", newline="") as f:
            writer = csv.writer(f)
            writer.writerow([
                "Name",
                "Yosys Area", "Yosys Delay",
                "Comb Area", "Comb Delay", "Comb Levels (CIRCT)",
                "Datapath Area", "Datapath Delay", "Datapath Levels (CIRCT)"
            ])
            for i in range(len(names)):
                writer.writerow([
                    names[i],
                    area['yosys'][i], delay['yosys'][i],
                    area['comb'][i], delay['comb'][i], circt_levels_list['comb'][i],
                    area['datapath'][i], delay['datapath'][i], circt_levels_list['datapath'][i]
                ])
        print(f"\nResults written to {csv_file}")

    
    ############################################################################
    # Plotting
    ############################################################################
    # Normalized ratios
    yosys_comparison_cell_ratios = [d/y if y else 0 for d, y in zip(cells_list['datapath'], cells_list['yosys'])]
    circt_level_ratios = [d/y if y else 0 for d, y in zip(circt_levels_list['datapath'], circt_levels_list['comb'])]
    comb_datapath_level_ratios = [d/y if y else 0 for d, y in zip(circt_levels_list['datapath'], circt_levels_list['comb'])]
    
    x = np.arange(len(names))  # label locations
    width = 0.35  # width of the bars

    # Create a 2x2 grid of subplots
    fig, axs = plt.subplots(2, 2, figsize=(14, 10))
    fig.suptitle(f"{bw}-bit", fontsize=18)
    
    # Datapath vs Yosys Cells Ration - Measured using Yosys
    axs[0, 0].set_title('Datapath/Yosys Cells Ratio (measured by Yosys)')
    bar1 = axs[0, 0].bar(x - width/4, yosys_comparison_cell_ratios, width/2, color='tab:blue', label='Cells')
    axs[0, 0].axhline(y=1, color='red', linestyle='--')
    axs[0, 0].set_xticks(x)
    axs[0, 0].set_xticklabels(names, rotation=45, ha='right')
    axs[0, 0].set_ylabel('Ratio')
    axs[0, 0].set_ylim(0, max(yosys_comparison_cell_ratios + [1.2]))
    # axs[0, 0].legend()

    # Datapath vs Comb Levels Ratios - Measured using CIRCT
    axs[0, 1].set_title('Datapath/Comb Longest Path Ratio (measured by CIRCT)')
    bar4 = axs[0, 1].bar(x + width/4, circt_level_ratios, width/2, color='tab:green', label='CIRCT')
    axs[0, 1].axhline(y=1, color='red', linestyle='--')
    axs[0, 1].set_xticks(x)
    axs[0, 1].set_xticklabels(names, rotation=45, ha='right')
    axs[0, 1].set_ylabel('Levels Ratio')
    axs[0, 1].set_ylim(0, max(comb_datapath_level_ratios + circt_level_ratios + [1.2]))
    # axs[0, 1].legend()

    # Cells comparison comb vs datapath vs yosys
    axs[1, 0].set_title('Area (measured by abc)')
    axs[1, 0].bar(x - width/2, area['comb'], width/2, color='tab:red', label='Comb')
    axs[1, 0].bar(x, area['datapath'], width/2, color='tab:green', label='Datapath')
    axs[1, 0].bar(x + width/2, area['yosys'], width/2, color='tab:purple', label='Yosys')
    axs[1, 0].set_xticks(x)
    axs[1, 0].set_xticklabels(names, rotation=45, ha='right')
    axs[1, 0].set_ylabel('Area (um^2)')
    axs[1, 0].legend()

    # Longest Path comparison comb vs datapath
    axs[1, 1].set_title('Delay (measured by abc)')
    axs[1, 1].bar(x - width/2, delay['comb'], width/2, color='tab:red', label='Comb')
    axs[1, 1].bar(x, delay['datapath'], width/2, color='tab:green', label='Datapath')
    axs[1, 1].bar(x + width/2, delay['yosys'], width/2, color='tab:purple', label='Yosys')
    axs[1, 1].set_xticks(x)
    axs[1, 1].set_xticklabels(names, rotation=45, ha='right')
    axs[1, 1].set_ylabel('Delay (ns)')
    
    axs[1, 1].legend()

    plt.tight_layout()
    plt.show()  

if __name__ == "__main__":
    main()