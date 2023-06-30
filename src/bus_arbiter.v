`include "head\\bus.v"
`include "head\\stddef.v"
module bus_arbiter (
    input  wire clk,
    input  wire reset,
    input  wire [`BusOwnerBus] m_req_,
    output reg [`BusOwnerBus] m_grnt_
);
    reg [`BusOwnerBus] owner;
    /****** 赋予总线使用权 ******/
    always @(*) begin
        m_grnt_[0] = `DISABLE_;
        m_grnt_[1] = `DISABLE_;
        m_grnt_[2] = `DISABLE_;
        m_grnt_[3] = `DISABLE_;
        case (owner)
            `BUS_OWNER_MASTER_0: begin
                m_grnt_[0] = `ENABLE_;
            end
            `BUS_OWNER_MASTER_1: begin
                m_grnt_[1] = `ENABLE_;
            end
            `BUS_OWNER_MASTER_2: begin
                m_grnt_[2] = `ENABLE_;
            end
            `BUS_OWNER_MASTER_3: begin
                m_grnt_[3] = `ENABLE_;
            end
        endcase
    end
  /****** 总线使用权的仲裁 ******/
    always @(posedge clk or `RESET_EDGE reset) begin
        if(reset == `RESET_ENABLE) begin
            /* 异步复位 */
            owner <= #1 `BUS_OWNER_MASTER_0;
        end else begin
            /* 仲裁 */
            case (owner)
                `BUS_OWNER_MASTER_0: begin
                    if(m_req_[0] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_0;
                    end else if(m_req_[1] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_1;
                    end else if(m_req_[2] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_2;
                    end else if(m_req_[3] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_3;
                    end
                end
                `BUS_OWNER_MASTER_1: begin
                    if(m_req_[1] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_1;
                    end else if(m_req_[2] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_2;
                    end else if(m_req_[3] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_3;
                    end else if(m_req_[0] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_0;
                    end
                end
                `BUS_OWNER_MASTER_2: begin
                    if(m_req_[2] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_2;
                    end else if(m_req_[3] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_3;
                    end else if(m_req_[0] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_0;
                    end else if(m_req_[1] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_1;
                    end
                end
                `BUS_OWNER_MASTER_3: begin
                    if(m_req_[3] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_3;
                    end else if(m_req_[0] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_0;
                    end else if(m_req_[1] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_1;
                    end else if(m_req_[2] == `ENABLE_) begin
                        onwer <= #1 `BUS_OWNER_MASTER_2;
                    end
                end
            endcase
        end
    end
endmodule  //bus_arbiter
