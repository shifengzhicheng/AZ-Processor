`include "head\\bus.v"
`include "head\\stddef.v"
module bus (
    input wire clk,
    input wire reset,
    input wire [`BusOwnerBus] req_,
    output wire [`BusOwnerBus] grnt_,
    input wire [`WordAddrBus] addr[`BUS_MASTER_CH-1:0],
    input wire [`BusOwnerBus] cs_,
    input wire [`BusOwnerBus] as_,
    input wire [`BusOwnerBus] rw,
    input wire [`WordDataBus] wr_data[`BUS_MASTER_CH-1:0],
    output wire [`WordDataBus] rd_data[`BUS_MASTER_CH-1:0],
    output wire [`WordDataBus] m_rd_data,
    output wire m_rdy_,
    output wire [`WordAddrBus] s_addr,
    output wire s_as_,
    output wire s_rw,
    output wire [`WordDataBus] s_wr_data,
    output wire [`BusSlaveIndexBus] s_cs_,
    input wire [`WordDataBus] s_rd_data [`BUS_SLAVE_CH-1:0],
    input wire [`BusSlaveIndexBus] s_rdy_
);

    // 实例化地址解码器模块
    bus_addr_dec dec (
        .s_cs_(s_cs_),
        .s_index(s_adder[`BusSlaveIndexLoc])
    );

    // 实例化总线仲裁器模块
    bus_arbiter arbiter (
        .clk(clk),
        .reset(reset),
        .m_req_(m_req_),
        .m_grnt_(m_grnt_)
    );

    // 实例化总线主控多路复用器模块
    bus_master_mux master_mux (
        .m_addr(m_addr),
        .m_as_(m_as_),
        .m_rw(m_rw),
        .m_wr_data(m_wr_data),
        .m_grnt_(m_grnt_),
        .s_addr(s_addr),
        .s_as_(s_as_),
        .s_rw(s_rw),
        .s_wr_data(s_wr_data)
    );

    // 实例化总线从属多路复用器模块
    bus_slave_mux slave_mux (
        .s_cs_(s_cs_),
        .s_rd_data(s_rd_data),
        .s_rdy_(s_rdy_),
        .m_rd_data(m_rd_data),
        .m_rdy_(m_rdy_)
    )
endmodule
