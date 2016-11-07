FROM openjdk:8-jdk

####################
# Grails
####################

ENV GRAILS_VERSION	3.2.2
ENV GRADLE_VERSION	3.1
ENV GRAILS_HOME		/opt/grails
ENV GRADLE_HOME		/opt/gradle
ENV PATH		$PATH:$GRAILS_HOME/bin:$GRADLE_HOME/bin

RUN apt-get -y -q update && apt-get install -q -y wget unzip openssl ca-certificates curl build-essential && \
    curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -q -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* && \
    npm install npm@latest -g && \
    npm install -g cnpm && \
    npm install -g angular-cli && \
    update-ca-certificates && \
    wget -q https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip -q grails-$GRAILS_VERSION.zip && \
    rm grails-$GRAILS_VERSION.zip && \
    mkdir -p /opt && \
    mv grails-$GRAILS_VERSION $GRAILS_HOME && \
    wget -q https://services.gradle.org/distributions/gradle-$GRADLE_VERSION-bin.zip && \
    unzip -q gradle-$GRADLE_VERSION-bin.zip && \
    rm gradle-$GRADLE_VERSION-bin.zip && \
    mv gradle-$GRADLE_VERSION $GRADLE_HOME

VOLUME /opt
WORKDIR $GRAILS_HOME
CMD grails
