/*
 -- ============================================================================
 -- FILE NAME	: uart.v
 -- DESCRIPTION : UART 头文件
 -- ============================================================================
*/

`ifndef __UART_HEADER__
`define __UART_HEADER__ // 包含文件防范

/*
【关于分频】
UART根据整个芯片的基频生成波特率。
要更改基频或波特率，
修改UART_DIV_RATE，UART_DIV_CNT_W和UartDivCntBus。修改UART_DIV_RATE，UART_DIV_CNT_W和UartDivCntBus。
UART_DIV_RATE定义分频率。
UART_DIV_RATE是基频除以波特率得到的结果。
UART_DIV_CNT_W定义除法计数器的位宽。
UART_DIV_CNT_W是UART_DIV_RATE的log2值。UART_DIV_CNT_W是UART_DIV_RATE的log2值。
UartDivCntBus是UART_DIV_CNT_W的总线表示。UartDivCntBus是UART_DIV_CNT_W的中断表示。
将其设置为UART_DIV_CNT_W-1：0。

【分频示例】
如果UART的波特率为38,400波特，整个芯片的基频为10 MHz，
UART_DIV_RATE为260，10,000,000÷38,400。UART_DIV_RATE为260，10,000,000÷38,400。
对于log2（260），UART_DIV_CNT_W为9。
*/


/********** 分频计数器 *********/
`define UART_DIV_RATE 9'd260  // 分频比率
`define UART_DIV_CNT_W 9	   // 分频计数器位宽
`define UartDivCntBus 8:0	   // 分频计数器总线

/********** 地址映射 **********/
`define UartAddrBus 0:0	// 地址总线
`define UART_ADDR_W 1	// 地址位宽
`define UartAddrLoc 0:0	// 地址位置

/********** 地址映射 **********/
`define UART_ADDR_STATUS 1'h0 // 控制寄存器0：状态
`define UART_ADDR_DATA 1'h1 // 控制寄存器1：接收的数据

/********** 位图 **********/
`define UartCtrlIrqRx 0	// 接收完成中断
`define UartCtrlIrqTx 1	// 发送完成中断
`define UartCtrlBusyRx 2	// 接收中状态位
`define UartCtrlBusyTx 3	// 发送中状态位

/********** 发送/接收状态 **********/
`define UartStateBus 0:0	// 状态总线
`define UART_STATE_IDLE 1'b0 // 状态 : 空闲状态
`define UART_STATE_TX 1'b1 // 状态 : 发送中
`define UART_STATE_RX 1'b1 // 状态 : 接收中

/********** 位计数器 **********/
`define UartBitCntBus 3:0	// 比特位计数器总线
`define UART_BIT_CNT_W 4	// 比特位计数器位宽
`define UART_BIT_CNT_START 4'h0 // 位计数器 : 起始位
`define UART_BIT_CNT_MSB 4'h8 // 位计数器 : 数据的MSB
`define UART_BIT_CNT_STOP 4'h9 // 位计数器 : 停止位

/********** 位定义 **********/
`define UART_START_BIT 1'b0 // 起始位
`define UART_STOP_BIT 1'b1 // 停止位

`endif
