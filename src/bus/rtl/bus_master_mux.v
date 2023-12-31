/*
 -- ============================================================================
 -- FILE NAME	: bus_master_mux.v
 -- DESCRIPTION : 总线主控用多路复用器
 -- ============================================================================
*/

/********** 通用头文件 **********/
`include "head/nettype.v"
`include "head/stddef.v"
`include "head/global_config.v"

/********** 单个头文件 **********/
`include "head/bus.v"

module bus_master_mux (
    m_addr,
    m_as_,
    m_rw,
    m_wr_data,
    m_grnt_,
    s_addr,
    s_as_,
    s_rw,
    s_wr_data
);
    /********** 总线主控信号 **********/
    input wire [`WordAddrBus] m_addr[`BUS_MASTER_CH-1:0],
    input wire [`BusOwnerBus] m_as_,
    input wire [`BusOwnerBus] m_rw,
    input wire [`WordDataBus] m_wr_data[`BUS_MASTER_CH-1:0],
    input wire [`BusOwnerBus] m_grnt_,
    /********** 共享信号总线从属 **********/
    output reg [`WordAddrBus] s_addr,
    output reg s_as_,
    output reg s_rw,
    output reg [`WordDataBus] s_wr_data
    /****** 总线主控多路复用器 ******/
    always @(*) begin
        if (m_grnt_[0] == `ENABLE_) begin
            s_addr    = m_addr[0];
            s_as_     = m_as_[0];
            s_rw      = m_rw[0];
            s_wr_data = m_wr_data[0];
        end else if (m_grnt_[1] == `ENABLE_) begin
            s_addr    = m_addr[1];
            s_as_     = m_as_[1];
            s_rw      = m_rw[1];
            s_wr_data = m_wr_data[1];
        end else if (m_grnt_[2] == `ENABLE_) begin
            s_addr    = m_addr[2];
            s_as_     = m_as_[2];
            s_rw      = m_rw[2];
            s_wr_data = m_wr_data[2];
        end else if (m_grnt_[3] == `ENABLE_) begin
            s_addr    = m_addr[3];
            s_as_     = m_as_[3];
            s_rw      = m_rw[3];
            s_wr_data = m_wr_data[3];
        end else begin
            s_addr    = `WORD_ADDR_W'h0;
            s_as_     = `DISABLE_;
            s_rw      = `READ;
            s_wr_data = `WORD_DATA_W'h0;
        end
    end
endmodule
