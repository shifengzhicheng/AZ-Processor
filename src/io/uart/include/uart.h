/*
 -- ============================================================================
 -- FILE NAME	: uart.h
 -- DESCRIPTION : UART?¶
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  2011/06/27  suito		 VKì¬
 -- ============================================================================
*/

`ifndef __UART_HEADER__
	`define __UART_HEADER__			// ïÜ¶hä

/*
 * y?°ª?z
 * UARTª®¢cÐIî?¶¬gÁ¦B
? *vXüî?½gÁ¦C
? *XüUART_DIV_RATECUART_DIV_CNT_WaUartDivCntBusB
? * UART_DIV_RATEè?ª¦B
? * UART_DIV_RATE¥î{?¦ÈgÁ¦B
? * UART_DIV_CNT_Wè?@?íI?xB
? * UART_DIV_CNT_W¥UART_DIV_RATEIlog2?B
? * UartDivCntBus¥UART_DIV_CNT_W??B
? *?«´?u?UART_DIV_CNT_W-1F0B
 *
 * yª?¦áz
 *@ÊUARTIgÁ¦?38,400gÁC®¢cÐIî??10 MHzC
? * UART_DIV_RATE?260C10,000,00038,400B
? *?°log2i260jCUART_DIV_CNT_W?9B
 */

	/********** ªüJE^ *********/
	`define UART_DIV_RATE	   9'd260  // ª?ä¦
	`define UART_DIV_CNT_W	   9	   // ª??íÊ?
	`define UartDivCntBus	   8:0	   // ª??í??
	/********** n¬?? **********/
	`define UartAddrBus		   0:0	// n¬??
	`define UART_ADDR_W		   1	// n¬?
	`define UartAddrLoc		   0:0	// n¬Êu
	/********** AhX}bv **********/
	`define UART_ADDR_STATUS   1'h0 // T§ñ¶í0Fó?
	`define UART_ADDR_DATA	   1'h1 // T§ñ¶í1F¾?I
	/********** rbg}bv **********/
	`define UartCtrlIrqRx	   0	// Úó®¬f
	`define UartCtrlIrqTx	   1	// ?®¬f
	`define UartCtrlBusyRx	   2	// Ú¾?uÊ
	`define UartCtrlBusyTx	   3	// ??uÊ
	/********** ?/Ú¾ó? **********/
	`define UartStateBus	   0:0	// ó???
	`define UART_STATE_IDLE	   1'b0 // ó? : ó?ó?
	`define UART_STATE_TX	   1'b1 // ó? : ?
	`define UART_STATE_RX	   1'b1 // ó? : Ú¾
	/********** Ê?í **********/
	`define UartBitCntBus	   3:0	// äÁ?í??
	`define UART_BIT_CNT_W	   4	// äÁ?íÊ?
	`define UART_BIT_CNT_START 4'h0 // ?í? : NnÊ
	`define UART_BIT_CNT_MSB   4'h8 // ?í? : IMSB
	`define UART_BIT_CNT_STOP  4'h9 // ??í? : â~Ê
	/********** Ê?? **********/
	`define UART_START_BIT	   1'b0 // NnÊ
	`define UART_STOP_BIT	   1'b1 // â~Ê

`endif
