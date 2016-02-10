FROM alaindomissy/docker-miniconda
MAINTAINER Alain Domissy alaindomissy@gmail.com

# NEEDED in ubuntu docker container (indeed!)
# fix ther errors trying to import pyplot
# see https://github.com/conda/conda/issues/1051
# but not working?
# RUN apt-get install libsm6 libxrender1 libfontconfig1

## INSTALL BLAST THIS WAY !?
############################
#install blast
#
#    ```
#    sudo apt-get install ncbi-blast+
#    ```
#
#the above installs in an outdated version on ubuntu 14.04, which is buggy
#
#    ```
#    $ blastn -version
#    blastn: 2.2.28+
#    Package: blast 2.2.28, build Jun  3 2013 11:17:14
#    ```
#
#do this instead:
#
#    ```
#    conda install -c https://conda.anaconda.org/bioconda blast
#    ```
#
#actually no, it is not working either! so do this instead:
#
#    ```
#    $ wget ftp://ftp.ncbi.nlm.nih.gov/blast/executables/LATEST/ncbi-blast-2.3.0+-x64-linux.tar.gz
#    $ tar xvfp ncbi-blast-2.3.0+-x64-linux.tar.gz
#    $ export PATH=”$PATH:$HOME/ncbi-blast-2.2.29+/bin”
#    $ mkdir ./ncbi-blast-2.2.29+/db
#    $export BLASTDB=”$HOME/ncbi-blast-2.2.29+/db”


# ubunutu bio cli tools
RUN apt-get install -y \
  libgomp1 \
  ncbi-blast+ \
  bedtools \
  conda install -y -c https://conda.anaconda.org/bioconda blast && \
  conda install -y -c https://conda.anaconda.org/bioconda pybedtools==0.7.4 && \
  conda install -y biopython==1.66


# other bio cli tools
#####################
# RUN apt-get install tabix
# RUN apt-get install igv     # igv not working in container, Twould need to generate graphics file wo X Xserver

# other bio pip packages
#########################
# RUN pip install primer3-py     # would need gcc

# other bio conda packages
##########################
# RUN conda install -y pysam==0.8.4



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

# ubunutu distro backup
RUN apt-get install -y duply

COPY files /
RUN chmod 600 /root/.ssh/id_rsa && \
    ln -s /RESTORE /BLASTDB && \
    ln -s /RESTORE /PROTOSP && \
    ln -s /data/dev /root/pycrispr

# /root/.cache/duplicity was already COPYed , but this makes an update
#RUN duply ecoli status && duply mm8 status && duply hg38 status
# ABOVE DOES NOT WORK DUE TO ssh key not protected with 600 permissions somehow


# miniconda
# root development executables
# app executables
ENV PATH /root/miniconda/bin:/opt/blast/bin:/root/bin:/BACKEND:$PATH
WORKDIR /root/


# apt-get install nano


# virtual envs    NOT NEEDED
###############
# RUN conda create -q -n crisprenv
# how to source activate in a Dockerfile? dont know, for now no venv
# source activate root


# duply mm8 status && duply hg18 status && duply ecoli status && duply phix status



# RUN git clone https://github.com/alaindomissy/pycrispr.git
# RUN pip install /root/pycrispr/
RUN pip install git+https://github.com/alaindomissy/pycrispr.git

CMD /BACKEND/app







