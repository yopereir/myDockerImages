FROM alpine/git as tacotronRepo
WORKDIR /
RUN git clone https://github.com/keithito/tacotron.git

FROM python:3.8 AS tensorflow
COPY --from=tacotronRepo /tacotron /tacotron
RUN pip install --upgrade pip
RUN pip install tensorflow
WORKDIR /tacotron
RUN pip install -r requirements.txt
# Uncomment the below lines to run the pre-trained model as mentioned here (https://github.com/keithito/tacotron#using-a-pre-trained-model). Visit localhost:9000 to view output.
# 
# RUN mkdir /models curl https://data.keithito.com/data/speech/tacotron-20180906.tar.gz | tar xzC /models
# RUN python3 demo_server.py --checkpoint /models/tacotron-20180906/model.ckpt
# EXPOSE 9000