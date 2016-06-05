# Minimal Java docker container based on busybox
# Image size = 180MB

FROM progrium/busybox
MAINTAINER "Ammar Najjar <najjarammar@gmail.com>"

# Udate wget to support SSL
RUN opkg-install wget

# Get and install Java
RUN ( wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" -O /tmp/jre.tar.gz  http://download.oracle.com/otn-pub/java/jdk/8u74-b02/jdk-8u74-linux-x64.tar.gz && gunzip /tmp/jre.tar.gz && cd /opt && tar xf /tmp/jre.tar && rm /tmp/jre.tar)

# Link Java into use, wget-ssl updates libpthread which causes Java to break
RUN ln -sf /lib/libpthread-2.18.so /lib/libpthread.so.0 && ln -s /opt/jdk1.8.0_74/bin/java /usr/bin/java && ln -s /opt/jdk1.8.0_74/bin/javac /usr/bin/javac
