`timescale 1ns/1ps
/**
  @brief Memory Controller module that does memory controller controlling

  @note Interface is on nyu-amba, which will be included as a package
*/
module MemCtrl
#(
  holdTime = 1
)
(
  input MemCommon_if.memCtrl mem, 
  output OpenRam_if.openRAMCtrl openRAM
);
  // Add memory controller logic here

  always @(mem.addr)
  begin
    openRAM.CS_B = 0;
    openRAM.OE_B = mem.write ? 0 : 1;
    openRAM.WE_B = mem.write ? 1 : 0;
  end

  always @(posedge mem.clk)
  begin
    openRAM.CS_B = #(holdTime) 1;
    if (mem.write)
      openRAM.WE_B <= #(holdTime) 1;
    else 
      openRAM.OE_B <= #(holdTime) 1;
  end

  assign openRAM.addr = mem.addr;
  assign openRAM.dataIn = mem.wData;

endmodule
