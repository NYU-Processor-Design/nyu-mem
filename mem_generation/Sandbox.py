import openram
import os

print("Hello World")

config_file = "{}/tests/configs/config".format(os.getenv("OPENRAM_HOME"))
openram.init_openram(config_file, is_unit_test=False)
# from openram import tech

# debug.info(2, "Checking three fingers PMOS")
# fet = factory.create(module_type="ptx",
#                         width=tech.drc["minwidth_tx"],
#                         mults=3,
#                         tx_type="pmos",
#                         connect_source_active=True,
#                         connect_drain_active=True,
#                         connect_poly=True)
# self.local_drc_check(fet)

openram.end_openram()


