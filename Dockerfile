FROM alaindomissy/docker-miniconda
MAINTAINER Alain Domissy alaindomissy@gmail.com

# NEEDED in ubuntu docker container (indeed!)
# fix ther errors trying to import pyplot
# see https://github.com/conda/conda/issues/1051
RUN apt-get install libsm6 libxrender1 libfontconfig1

# bio cli tools
RUN apt-get install ncbi-blast+ bedtools
# not needed
# RUN apt-get install tabix
# RUN apt-get install igv     # igv nort working in container, need Xserver ?


# RUN conda create -q -n     # how to source activate in a Dockerfile ? dot know, so not creating an env for now
RUN conda install -y python=2.7 biopython==1.66 cycler==0.9.0 Cython==0.23.4 decorator==4.0.6
RUN conda install -y numpy==1.10.2 matplotlib
RUN conda install -y pyqt
RUN conda install -y py==1.4.31 pyparsing==2.0.3 python-dateutil==2.4.2 pytz==2015.7

# not needed ?
# RUN conda install -y pybedtools==0.7.4
# not needed
# RUN conda install -y pysam==0.8.4

WORKDIR /root/
RUN git clone https://github.com/alaindomissy/pycrispr.git
