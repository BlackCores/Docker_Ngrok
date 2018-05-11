@echo off  
title 专业打洞
color F
echo=
echo= 
echo= 
echo= --------------------------------------------------------------------
echo= 
echo= 	如果输入的前缀是：www	则映射的地址为：www.gomyb.com
echo= 
echo= 
set /p prefix=请输入映射的前缀：
echo= 
echo= 
set /p port=请输入映射的端口号：
ngrok -config ngrok.cfg -subdomain %prefix% %port%
pause