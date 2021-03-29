FROM alpine/git as tacotronRepo
WORKDIR /
RUN git clone https://github.com/keithito/tacotron.git

FROM python:3.8 AS tensorflow
COPY --from=tacotronRepo /tacotron /tacotron
WORKDIR /tacotron
RUN python3 -m pip install --upgrade pip
RUN pip install -r requirements.txt
RUN pip install tensorflow