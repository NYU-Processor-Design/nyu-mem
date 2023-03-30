/**
  @brief Memory Controller module that does memory controller controlling

  @note Interface is on nyu-amba, which will be included as a package
*/
module MemCtrl(
  MemCommon_if.memCtrl mem, 
  OpenRam_if.openRAMCtrl openRAM
);
  // Add memory controller logic here

  always @(posedge mem.clk)
  begin
    if (mem.write)
      begin
        
      end
    else
      begin

      end
  end

endmodule
