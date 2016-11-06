FROM openjdk:8-jdk

####################
# Grails
####################

ENV GRAILS_VERSION	3.2.2
ENV GRAILS_HOME		/opt/grails
ENV PATH		$PATH:$GRAILS_HOME/bin:$GRAILS_HOME/sbin

RUN apt-get install -q -y wget unzip openssl ca-certificates 

RUN update-ca-certificates && \
    wget -q https://github.com/grails/grails-core/releases/download/v3.2.2/grails-3.2.2.zip && \
    unzip  grails-$GRAILS_VERSION.zip && \
    rm grails-$GRAILS_VERSION.zip && \
    mkdir -p /opt && \
    mv grails-$GRAILS_VERSION $GRAILS_HOME 

VOLUME /opt/grails
WORKDIR $GRAILS_HOME
CMD grails
