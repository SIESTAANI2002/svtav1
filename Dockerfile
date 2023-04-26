FROM python:3.9.2-slim-buster
RUN mkdir /bot && chmod 777 /bot
WORKDIR /bot
ENV DEBIAN_FRONTEND=noninteractive
RUN apt -qq update && apt -qq install -y git wget pv jq python3-dev ffmpeg mediainfo
RUN apt-get install neofetch wget -y -f
RUN apt-get install -y git
RUN apt-get install software-properties-common -y
RUN apt-get update
RUN git clone https://github.com/XniceCraft/ffmpeg-colab --depth 1
RUN chmod +x ./ffmpeg-colab/install
RUN ./ffmpeg-colab/install
RUN add-apt-repository ppa:savoury1/ffmpeg4 -y
RUN apt full-upgrade -y

copy . .
RUN pip3 install -r requirements.txt
CMD ["bash","run.sh"]
