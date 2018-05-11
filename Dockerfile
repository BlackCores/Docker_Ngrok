FROM centos:latest
MAINTAINER "Mr_He"<HelloHeSir@gmail.com>
ENV NGROK_URL=https://github.com/tutumcloud/ngrok.git
ENV DNS_URL=gomyb.com
RUN \
		yum install git -y && \
		yum install golang -y && \
		yum install openssl -y && \
		cd /home && \
		mkdir git && \
		cd git && \
		git clone ${NGROK_URL} && \
		cd ngrok && \
		openssl genrsa -out base.key 2048 && \
		openssl req -new -x509 -nodes -key base.key -days 10000 -subj "/CN=${DNS_URL}" -out base.pem && \
		openssl genrsa -out server.key 2048 && \
		openssl req -new -key server.key -subj "/CN=${DNS_URL}" -out server.csr && \
		openssl x509 -req -in server.csr -CA base.pem -CAkey base.key -CAcreateserial -days 10000 -out server.crt && \
		cp base.pem assets/client/tls/ngrokroot.crt && \
		make release-server release-client && \
		GOOS=windows GOARCH=amd64 make release-client
COPY start.sh /home/start.sh
RUN chmod +x /home/start.sh
ENTRYPOINT ["/home/start.sh"]