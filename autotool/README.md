# Books
<21 century C language>

##
automake

autoconf

libtool

### install on Mac
brew install autoconf automake libtool

### steps
生成Makefile.am, hello.c
autoscan

生成了autoscan.log, configure.scan

在第10行加入AM_INIT_AUTOMAKE

改为configure.ac

touch NEWS README AUTHORS ChangeLog

autoreconf -iv

完成

./configure

make



