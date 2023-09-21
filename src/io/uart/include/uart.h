/*
 -- ============================================================================
 -- FILE NAME	: uart.h
 -- DESCRIPTION : UART?����
 -- ----------------------------------------------------------------------------
 -- Revision  Date		  Coding_by	 Comment
 -- 1.0.0	  2011/06/27  suito		 �V�K�쐬
 -- ============================================================================
*/

`ifndef __UART_HEADER__
	`define __UART_HEADER__			// ��ܕ����h�

/*
 * �y?����?�z
 * UART���������c�ГI��?�����g�����B
? *�v�X����?���g�����C
? *�X��UART_DIV_RATE�CUART_DIV_CNT_W�aUartDivCntBus�B
? * UART_DIV_RATE��?�������B
? * UART_DIV_RATE����{?�����Ȕg�����B
? * UART_DIV_CNT_W��?���@?����I?�x�B
? * UART_DIV_CNT_W��UART_DIV_RATE�Ilog2?�B
? * UartDivCntBus��UART_DIV_CNT_W??�B
? *?����?�u?UART_DIV_CNT_W-1�F0�B
 *
 * �y��?����z
 *�@��UART�I�g����?38,400�g���C�����c�ГI��??10 MHz�C
? * UART_DIV_RATE?260�C10,000,000��38,400�B
? *?��log2�i260�j�CUART_DIV_CNT_W?9�B
 */

	/********** �����J�E���^ *********/
	`define UART_DIV_RATE	   9'd260  // ��?�䗦
	`define UART_DIV_CNT_W	   9	   // ��??�����?
	`define UartDivCntBus	   8:0	   // ��??����??
	/********** �n��?? **********/
	`define UartAddrBus		   0:0	// �n��??
	`define UART_ADDR_W		   1	// �n��?
	`define UartAddrLoc		   0:0	// �n���ʒu
	/********** �A�h���X�}�b�v **********/
	`define UART_ADDR_STATUS   1'h0 // �T���񑶊�0�F��?
	`define UART_ADDR_DATA	   1'h1 // �T���񑶊�1�F��?�I����
	/********** �r�b�g�}�b�v **********/
	`define UartCtrlIrqRx	   0	// �ڎ󊮐����f
	`define UartCtrlIrqTx	   1	// ?���������f
	`define UartCtrlBusyRx	   2	// �ڝ���?�u��
	`define UartCtrlBusyTx	   3	// ?����?�u��
	/********** ?��/�ڝ���? **********/
	`define UartStateBus	   0:0	// ��???
	`define UART_STATE_IDLE	   1'b0 // ��? : ��?��?
	`define UART_STATE_TX	   1'b1 // ��? : ?����
	`define UART_STATE_RX	   1'b1 // ��? : �ڝ���
	/********** ��?���� **********/
	`define UartBitCntBus	   3:0	// ���?����??
	`define UART_BIT_CNT_W	   4	// ���?�����?
	`define UART_BIT_CNT_START 4'h0 // ?����? : �N�n��
	`define UART_BIT_CNT_MSB   4'h8 // ?����? : �����IMSB
	`define UART_BIT_CNT_STOP  4'h9 // ??��? : ��~��
	/********** ��?? **********/
	`define UART_START_BIT	   1'b0 // �N�n��
	`define UART_STOP_BIT	   1'b1 // ��~��

`endif
