
Simple CH341 SPI Programmer, supports  Linux

Linux:
	make

libusb
git submodule init
git submodule update

./configure --build=i686-linux --host=mips-linux CC=mips-linux-gnu-gcc CXX=mips-linux-gnu--g++ --disable-udev

#### 交叉编译libusb #### 
1. 执行下列指令 （指令在一行）
`./configure --build=i686-linux --host=arm-linux CC=/kit/arm/gcc/3.3.6/bin/arm-linux-gcc CXX=/kit/arm/gcc/3.3.6/bin/arm-linux-g++`
2. 执行上述指令后报如下错误 
configure:error:“udev support requested but libudev not installed” 
解决方法：在上述编译命令后面添加 --disable-udev
3. 然后执行make&&make install
4. 执行完make install后我们可以在prefix指定的目录中看到编译好的库及相应的头文件。在arm平台下使用的库文件名称是：libusb-1.0.so.0.1.0。
5. –build=i686-linux表示该软件在x86平台被编译
6. –host=arm-linux表示该软件编译完成后在arm平台上运行
7. –prefix后面为软件安装目录。
8. CC=,CXX等于指定了交叉编译使用的C，C++交叉编译器


LICENSE

These codes are put into public domain.
