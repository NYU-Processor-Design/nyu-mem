/**
  @brief signals for OpenRAM Memory
  
  @param DataWidth    bit-width of data transfers
  @param AddrWidth    bit-width of addresses

  @input clk      clock
  @input nReset   active-low-reset

  @logic addr       byte address of the transfer
  @logic wData      write data from memory to subordinates
  @logic write      transfer direction, high/write low/read
  
  @logic resp       response bus
  @logic rData      read data from subordinates to memory
*/
interface OpenRam_if #(
  DataWidth = 32,
  AddrWidth = 32
) (
  input clk
);

  logic [AddrWidth - 1:0] addr;
  logic [DataWidth - 1:0] dataIn;
  logic [DataWidth - 1:0] dataOut;
  
  logic OE_B;
  logic CS_B;
  logic WE_B;


  modport openRAMCtrl(
    input clk,

    input addr,
    input dataIn,
    input OE_B,
    input CS_B,
    input WE_B,

    output dataOut
  );

endinterface
