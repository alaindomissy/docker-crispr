FROM alaindomissy/docker-miniconda
MAINTAINER Alain Domissy alaindomissy@gmail.com

RUN conda create -q -n crispr-venv python=2.7 biopython==1.66 cycler==0.9.0 Cython==0.23.4 decorator==4.0.6 numpy==1.10.2 matplotlib

WORKDIR /root/
RUN git clone https://github.com/alaindomissy/pycrispr.git
