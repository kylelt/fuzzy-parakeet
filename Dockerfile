
FROM nvidia/cuda:12.3.2-base-ubuntu22.04
ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y python3.8-dev # Python 3.8 specific items 
RUN apt-get install -y python3-opencv python3-pip 
RUN apt-get install -y libglib2.0-0 # Others


#COPY requirements.txt requirements.txt

#RUN python3 -m pip install -r requirements.txt
RUN python3 -m pip install --upgrade pip


RUN pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu121



WORKDIR /app

ENTRYPOINT ["python3"]
