# Data word size
word_size = 8
# Number of words in the memory
num_words = 16

# Since this is ROM, set the number of read ports to a non-zero value and the 
# number of Read-Write and just Write ports to 0.
# Read-Write ports
num_rw_ports = 1
# Read-only ports
num_r_ports = 0
# Write-only ports
num_w_ports = 0

# Technology to use in $OPENRAM_TECH
tech_name = "scn4m_subm"
# Process corners to characterize
process_corners = [ "TT" ]
# Voltage corners to characterize
supply_voltages = [ 3.3 ]
# Temperature corners to characterize
temperatures = [ 25 ]

# Output directory for the results
output_path = "temp"
# Output file base name
output_name = "ROM_Mem"

output_dir = "/Users/seandoyle/NYU/classes/ProcessorDesign/nyu-mem/mem_generation"

# Disable analytical models for full characterization (WARNING: slow!)
# analytical_delay = False

# To force this to use magic and netgen for DRC/LVS/PEX
# Could be calibre for FreePDK45
drc_name = "magic"
lvs_name = "netgen"
pex_name = "magic"