module MemCtrl_tl #(
    DataWidth = 32,
    AddrWidth = 32
) (
    input nReset,
    input clk,

    input [AddrWidth - 1:0] addr,
    input [DataWidth - 1:0] wData,
    input write,

    output [1:0] resp,
    output [DataWidth - 1:0] rData
);

  MemCommon_if #(DataWidth, AddrWidth) mem_if (
      nReset,
      clk
  );

  assign mem_if.addr = addr;
  assign mem_if.wData = wData;
  assign mem_if.write = write;

  assign resp = mem_if.resp;
  assign rData = mem_if.rData;

  MemCtrl mem (mem_if.memCtrl);

endmodule
