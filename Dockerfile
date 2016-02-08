FROM alaindomissy/docker-miniconda
MAINTAINER Alain Domissy alaindomissy@gmail.com

# NEEDED in ubuntu docker container (indeed!)
# fix ther errors trying to import pyplot
# see https://github.com/conda/conda/issues/1051
# but not working?
# RUN apt-get install libsm6 libxrender1 libfontconfig1

# ubunutu distro baclup and bio cli tools

RUN apt-get install -y \
  duply \
  libgomp1 \
  ncbi-blast+ \
  bedtools

# NOT NEEDED NOW:

# other bio cli tools
# RUN apt-get install tabix
# RUN apt-get install igv     # igv not working in container, Twould need to generate graphics file wo X Xserver

# virtual envs
# RUN conda create -q -n crisprenv
# how to source activate in a Dockerfile? dont know, for now no venv

# other bio pip packages
# RUN pip install primer3-py     # would need gcc

# other bio conda packages
# RUN conda install -y pysam==0.8.4

RUN conda install -y \
  biopython==1.66
RUN conda install -y \
  cycler==0.9.0 \
  cython==0.23.4 \
  decorator==4.0.6 \
  py==1.4.31 \
  pyparsing==2.0.3 \
  python-dateutil==2.4.2 \
  pytz==2015.7
RUN conda install -y \
  numpy==1.10.4 \
  matplotlib==1.5.1 \
  pyqt==4.11.4
RUN conda install -y -c https://conda.anaconda.org/bioconda pybedtools==0.7.4
RUN conda install -y -c https://conda.anaconda.org/bioconda blast

COPY files1 /
RUN chmod 600 /root/.ssh/id_rsa
RUN ln -s /RESTORE /BLASTDB && ln -s /RESTORE /PROTOSP && ln -s /data/dev /root/pycrispr

# /root/.cache/duplicity was already COPYed , but this makes an update
#RUN duply ecoli status && duply mm8 status && duply hg38 status
# ABOVE DOES NOT WORK DUE TO ssh key not protected with 600 permissions somehow

# anaconda
# ncbi-blast+
# root development executables
# app executables
ENV PATH /root/miniconda/bin:/opt/blast/bin:/root/bin:/BACKEND:$PATH
WORKDIR /root/

# RUN git clone https://github.com/alaindomissy/pycrispr.git
# RUN pip install /root/pycrispr/

# git config --global push.default simple
# apt-get install nano
# source activate root
# duply mm8 status && duply hg18 status && duply ecoli status && duply phix status

RUN pip install git+https://github.com/alaindomissy/pycrispr.git
