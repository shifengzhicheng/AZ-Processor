/*
 -- ============================================================================
 -- FILE NAME	: bus_slave_mux.v
 -- DESCRIPTION : 总线从属用多路复用器
 -- ============================================================================
*/

/********** 通用头文件 **********/
`include "head/nettype.v"
`include "head/stddef.v"
`include "head/global_config.v"

/********** 单个头文件 **********/
`include "head/bus.v"

module bus_slave_mux (
    s_cs_,
    s_rd_data,
    s_rdy_,
    m_rd_data,
    m_rdy_
);
    /********** 芯片选择 **********/
    input wire [`BusSlaveIndexBus]  s_cs_,
    /********** 总线从属信号 **********/
    input wire [`WordDataBus]       s_rd_data[`BUS_SLAVE_CH-1:0],
    input wire [`BusSlaveIndexBus]  s_rdy_,
    /********** 总线主控共享信号 **********/
    output reg [`WordDataBus]       m_rd_data,
    output reg                      m_rdy_

    /****** 总线从属多路复用器 ******/
    always @( *) begin
        /* 选择片选信号对应的从属 */
        if(s_cs_[0] == `ENABLE_)begin
            m_rd_data = s_rd_data[0];
            m_rdy_ = s_rdy_[0];
        end else if(s_cs_[1] == `ENABLE_) begin
            m_rd_data = s_rd_data[1];
            m_rdy_ = s_rdy_[1];
        end else if(s_cs_[2] == `ENABLE_) begin
            m_rd_data = s_rd_data[2];
            m_rdy_ = s_rdy_[2];
        end else if(s_cs_[3] == `ENABLE_) begin
            m_rd_data = s_rd_data[3];
            m_rdy_ = s_rdy_[3];
        end else if(s_cs_[4] == `ENABLE_) begin
            m_rd_data = s_rd_data[4];
            m_rdy_ = s_rdy_[4];
        end else if(s_cs_[5] == `ENABLE_) begin
            m_rd_data = s_rd_data[5];
            m_rdy_ = s_rdy_[5];
        end else if(s_cs_[6] == `ENABLE_) begin
            m_rd_data = s_rd_data[6];
            m_rdy_ = s_rdy_[6];
        end else if(s_cs_[7] == `ENABLE_) begin
            m_rd_data = s_rd_data[7];
            m_rdy_ = s_rdy_[7];
        end else begin
            m_rd_data = `WORD_DATA_W'h0;
            m_rdy_ = `DISABLE_;
        end     
    end

endmodule
