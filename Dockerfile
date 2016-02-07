FROM alaindomissy/docker-miniconda
MAINTAINER Alain Domissy alaindomissy@gmail.com

# NEEDED in ubuntu docker container (indeed!)
# fix ther errors trying to import pyplot
# see https://github.com/conda/conda/issues/1051

# not working
#RUN apt-get install libsm6 libxrender1 libfontconfig1

# bio cli tools
RUN apt-get install -y \
  ncbi-blast+ \
  bedtools

RUN apt-get install -y \
  duply

# other bio cli tools not needed for now
# RUN apt-get install tabix
# RUN apt-get install igv     # igv not working in container,
# how to generate graphics file wo X Xserver


# RUN conda create -q -n crisprenv
# how to source activate in a Dockerfile? dot know, for now no venv

RUN conda install -y \
  biopython==1.66 \
  cycler==0.9.0 \
  cython==0.23.4 \
  decorator==4.0.6

RUN conda install -y \
  numpy==1.10.4 \
  matplotlib==1.5.1 \
  pyqt==4.11.4

RUN conda install -y \
  py==1.4.31 \
  pyparsing==2.0.3 \
  python-dateutil==2.4.2 \
  pytz==2015.7

RUN conda install -y -c https://conda.anaconda.org/bioconda pybedtools==0.7.4

# would need gcc
#RUN pip install primer3-py

# not needed for now
# RUN conda install -y pysam==0.8.4

WORKDIR /root/

COPY filesystemroot /

RUN ln -s /RESTORE /BLASTDB && ln -s /RESTORE /PROTOSP

RUN git clone https://github.com/alaindomissy/pycrispr.git

# RUN pip install /root/pycrispr/


# do we need this?
#export PATH="/root/miniconda/bin:$PATH"

# for ncbi-blast+   # for the app executables   # for developement utility executables
ENV PATH /opt/blast/bin:/APP:/root/pycripr/bin:$PATH
