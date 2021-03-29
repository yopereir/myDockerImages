FROM alpine/git as repos
WORKDIR /
RUN git clone https://github.com/NVIDIA/apex.git
RUN git clone https://github.com/NVIDIA/tacotron2.git
WORKDIR /tacotron2
RUN git submodule init; git submodule update
RUN sed -i -- 's,DUMMY,ljs_dataset_folder/wavs,g' filelists/*.txt

FROM nvcr.io/nvidia/pytorch:21.02-py3
COPY --from=repos /apex /apex
WORKDIR /apex
#RUN pip install -v --disable-pip-version-check --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" ./
COPY --from=repos /tacotron2 /tacotron2
WORKDIR /tacotron2
RUN pip install -r requirements.txt
RUN python train.py --output_directory=outdir --log_directory=logdir