FROM tensorflow/tensorflow:latest-gpu

MAINTAINER Andreas Fritzler <andreas.fritzler@gmail.com>

RUN pip --no-cache-dir install keras

COPY ./keyboard /etc/default/keyboard

RUN DEBIAN_FRONTEND=noninteractive \
	apt-get update && apt-get install -qq -y \
	git \
	nvidia-375 \
	cuda-8-0 \
	&& rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/fchollet/keras.git /keras

CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
