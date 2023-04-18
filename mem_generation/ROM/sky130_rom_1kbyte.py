# See LICENSE for licensing information.
#
# Copyright (c) 2016-2023 Regents of the University of California and The Board
# of Regents for the Oklahoma Agricultural and Mechanical College
# (acting for and on behalf of Oklahoma State University)
# All rights reserved.
#

word_size = 1

check_lvsdrc = True

rom_data = "/mem_generation/ROM/example_1kbyte.py"

import os

output_name = "ROM_memory"
output_path = os.path.dirname(__file__) + "/generated_mem"


exec(open(os.path.join(os.path.dirname(__file__), 'sky130_rom_common.py')).read())
