FROM alaindomissy/docker-miniconda
MAINTAINER Alain Domissy alaindomissy@gmail.com

#RUN conda create -q -n
RUN conda install -y python=2.7 biopython==1.66 cycler==0.9.0 Cython==0.23.4 decorator==4.0.6 numpy==1.10.2 matplotlib

RUN conda install -y py==1.4.31 pybedtools==0.7.4 pyparsing==2.0.3 pysam==0.8.4 python-dateutil==2.4.2 pytz==2015.7

WORKDIR /root/
RUN git clone https://github.com/alaindomissy/pycrispr.git
