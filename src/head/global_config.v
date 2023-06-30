`ifndef __GLOBAL_CONFIG_HEADER__ // 包含文件防范
`define __GLOBAL_CONFIG_HEADER__

/********** 全局设置宏定义 **********/
`define POSITIVE_RESET
`define NEGATIVE_RESET

`define POSITIVE_MEMORY
`define NEGATIVE_MEMORY

`define IMPLEMENT_TIMER 
`define IMPLEMENT_UART
`define IMPLEMENT_GPIO

`define IMPLEMENT_UART

`define IMPLEMENT_GPIO

`define RESET_EDGE negedge // 使用负沿复位信号边沿（对应定义NEGATIVE_RESET时）
`define RESET_ENABLE 1'b0 // 复位有效（对应定义NEGATIVE_RESET时）
`define RESET_DISABLE 1'b1 // 复位无效（对应定义NEGATIVE_RESET时）

`define MEM_ENABLE 1'b1 // 内存有效（对应定义POSITIVE_MEMORY时）
`define MEM_DISABLE 1'b0 // 内存无效（对应定义POSITIVE_MEMORY时）

`endif