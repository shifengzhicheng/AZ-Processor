# 个人项目之实现一个 AZ Processor

这个项目期望实现一个 比较经典的简单 CPU 并尝试一些简单的运行测试。

## 总线部分

![bus](picture\bus.png)

## 存储器的设计与实现



使用iverilog进行调试程序看输出。

```shell
iverilog -DROM_PRG=\"rom.dat\" -DSPM_PRG=\"ram.dat\" -DSIM_CYCLE=1000 -o chip_top.out -s chip_top_test -I ..\..\top\include -I ..\..\cpu\include -I ..\..\bus\include -I ..\..\io\rom\include -I ..\..\io\timer\include -I ..\..\io\uart\include -I ..\..\io\gpio\include -y ..\..\top\lib ..\..\top\test\chip_top_test.v ..\..\top\rtl\*.v ..\..\io\rom\rtl\*.v ..\..\io\uart\rtl\*.v ..\..\io\timer\rtl\*.v ..\..\io\gpio\rtl\*.v ..\..\cpu\rtl\*.v ..\..\bus\rtl\*.v
vvp chip_top.out 
```