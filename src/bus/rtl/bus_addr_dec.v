/*
 -- ============================================================================
 -- FILE NAME	: bus_addr_dec.v
 -- DESCRIPTION : 地址解码器
 -- ============================================================================
*/

/********** 通用头文件 **********/
`include "nettype.h"
`include "stddef.h"
`include "global_config.h"

/********** 单个头文件 **********/
`include "bus.h"

module bus_addr_dec (
    s_index,
    s_cs_
);
    /********** 地址 **********/
    input wire [`BusSlaveIndexBus] s_index;  // 总线从属索引地址
    
    /********** 片选 **********/
    output reg [`BusSlaveIndexBus] s_cs_;  // 0-7总线从属

    /****** 总线从属索引 ******/
    always @(*) begin
        /* 初始化片选信号 */
        s_cs_[0] = `DISABLE_;
        s_cs_[1] = `DISABLE_;
        s_cs_[2] = `DISABLE_;
        s_cs_[3] = `DISABLE_;
        s_cs_[4] = `DISABLE_;
        s_cs_[5] = `DISABLE_;
        s_cs_[6] = `DISABLE_;
        s_cs_[7] = `DISABLE_;
        /* 选择地址对应的从属 */
        case (s_index)
            `BUS_SLAVE_0: begin
                s_cs_[0] = `ENABLE_;
            end
            `BUS_SLAVE_1: begin
                s_cs_[1] = `ENABLE_;
            end
            `BUS_SLAVE_2: begin
                s_cs_[2] = `ENABLE_;
            end
            `BUS_SLAVE_3: begin
                s_cs_[3] = `ENABLE_;
            end
            `BUS_SLAVE_4: begin
                s_cs_[4] = `ENABLE_;
            end
            `BUS_SLAVE_5: begin
                s_cs_[5] = `ENABLE_;
            end
            `BUS_SLAVE_6: begin
                s_cs_[6] = `ENABLE_;
            end
            `BUS_SLAVE_7: begin
                s_cs_[7] = `ENABLE_;
            end
        endcase
    end
    // 因为需要 3 个比特位（2 的 3 次方为 8）来区分 8 个总线从属通道，
    // 所以地址的最高 3 位用来识别总线从属。并且基于地址（s_addr）的最高 3 位
    // 生成总线从属索引（s_index）。
endmodule  //bus_addr_dec
