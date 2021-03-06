FROM java:jre-alpine

MAINTAINER Nishan Chathuranga <inbox.nishan@gmail.com>

RUN apk add --update --no-cache \
	 unzip \
	 wget

RUN wget http://nlp.stanford.edu/software/stanford-corenlp-full-2018-10-05.zip
RUN unzip stanford-corenlp-full-2018-10-05.zip && \
	rm stanford-corenlp-full-2018-10-05.zip

WORKDIR stanford-corenlp-full-2018-10-05

RUN export CLASSPATH="`find . -name '*.jar'`"

# ENV PORT 9000

EXPOSE $PORT

CMD java -mx6g -cp "*" edu.stanford.nlp.pipeline.StanfordCoreNLPServer -port $PORT -timeout 1000
