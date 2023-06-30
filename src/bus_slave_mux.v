`include "head\\bus.v"
`include "head\\stddef.v"
module bus_slave_mux (
    input wire [`BusSlaveIndexBus] s_cs_,
    input wire [`WordDataBus] s_rd_data[`BUS_SLAVE_CH-1:0],
    input wire [`BusSlaveIndexBus] s_rdy_,
    output reg [`WordDataBus] m_rd_data,
    output reg m_rdy_
);
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
