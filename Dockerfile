FROM openjdk:8-jdk

####################
# Grails
####################

ENV GRAILS_VERSION	3.2.2
ENV GRAILS_HOME		/opt/grails
ENV PATH		$PATH:$GRAILS_HOME/bin:$GRAILS_HOME/sbin


RUN apt-get -y -q update && apt-get install -q -y wget unzip openssl ca-certificates curl && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -q -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*



RUN npm install npm@latest -g && \
    npm install -g cnpm && \
    npm install -g angular-cli && \
    update-ca-certificates && \
    wget -q https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip grails-$GRAILS_VERSION.zip && \
    rm grails-$GRAILS_VERSION.zip && \
    mkdir -p /opt && \
    mv grails-$GRAILS_VERSION $GRAILS_HOME 

VOLUME /opt/grails
WORKDIR $GRAILS_HOME
CMD grails
