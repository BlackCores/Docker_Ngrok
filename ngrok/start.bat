@echo off  
title רҵ��
color F
echo=
echo= 
echo= 
echo= --------------------------------------------------------------------
echo= 
echo= 	��������ǰ׺�ǣ�www	��ӳ��ĵ�ַΪ��www.gomyb.com
echo= 
echo= 
set /p prefix=������ӳ���ǰ׺��
echo= 
echo= 
set /p port=������ӳ��Ķ˿ںţ�
ngrok -config ngrok.cfg -subdomain %prefix% %port%
pause