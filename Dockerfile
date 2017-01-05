FROM aoingl/docker-images:docker-0.1

MAINTAINER Leo Gao <aoingl@gmail.com>

# install ffmpeg mplayer and libav to support audio & video convert
RUN apt-get update \
  && apt-get install -y mplayer mencoder ffmpeg libavcodec-dev libavcodec-extra libavcodec-ffmpeg-extra56  libavformat-dev libavformat-ffmpeg56 libavutil-dev libavutil-ffmpeg54 libavdevice-dev libavdevice-ffmpeg56 libswscale-dev libswscale-ffmpeg3 libavfilter-dev libavfilter-ffmpeg5 libpostproc-dev libpostproc-ffmpeg53 libswresample-dev libswresample-ffmpeg1  libav-tools

# install images convert utilities
RUN apt-get install -y imagemagick python-pythonmagick python-wand imagemagick-doc

# install ocr
RUN apt-get install -y fonts-ocr-a tesseract-ocr libtesseract-dev libtesseract3 pdfsandwich python-pyocr tesseract-ocr-all

# install pdf/word/execel/chm convert utilites
RUN apt-get install -y ghostscript libqpdf-dev qpdf antiword chm2pdf diffpdf cups-pdf dblatex docbook-utils fig2ps gscan2pdf gtk-vector-screenshot htmldoc img2pdf pdf2djvu pdf2htmlex pdf2svg pdfgrep pdfmod pdfshuffler 

# install latest youtube-dl from github
RUN wget https://yt-dl.org/downloads/latest/youtube-dl -O /usr/local/bin/youtube-dl && chmod a+rx /usr/local/bin/youtube-dl

