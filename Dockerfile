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
  biopython==1.66 \
  cycler==0.9.0 \
  cython==0.23.4 \
  decorator==4.0.6 \
  numpy==1.10.4 \
  matplotlib==1.5.1 \
  pyqt==4.11.4 \
  py==1.4.31 \
  pyparsing==2.0.3 \
  python-dateutil==2.4.2 \
  pytz==2015.7
RUN conda install -y -c https://conda.anaconda.org/bioconda pybedtools==0.7.4

COPY filesystemroot /
# RUN chmod 600 /root/.ssh/id_rsa \
RUN ln -s /RESTORE /BLASTDB && ln -s /RESTORE /PROTOSP
 # /root/.cache/duplicity was already COPYed , but this makes an update
RUN duply ecoli status && duply mm8 status && duply hg38 status

# anaconda
# ncbi-blast+
# root development executables
# app executables
ENV PATH /root/miniconda/bin:/opt/blast/bin:/root/bin:/BACKEND:$PATH
WORKDIR /root/

# RUN git clone https://github.com/alaindomissy/pycrispr.git
# RUN pip install /root/pycrispr/
