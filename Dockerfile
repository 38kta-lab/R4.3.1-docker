FROM rocker/rstudio:4.3.1

# install libxt6, libxml2-dev and libfontconfig1-dev for ggmsa
RUN apt-get update && apt-get install -y wget libxt6
RUN apt-get update && apt-get install -y libxml2-dev
RUN apt-get update && apt install -y libpng-dev
RUN apt-get update && apt install -y libfontconfig1-dev
RUN apt-get update && apt install -y libproj-dev

# install seqkit
RUN wget "https://github.com/shenwei356/seqkit/releases/download/v2.5.1/seqkit_linux_arm64.tar.gz" -O /tmp/seqkit.tar.gz && \
	tar zxvf /tmp/seqkit.tar.gz -C /usr/bin/ && rm /tmp/seqkit.tar.gz

# Install from CRAN
RUN R -e "install.packages('BiocManager',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('dplyr',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('TDbook',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggstar',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('TreeTools',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('phytools',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('geiger',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('ggnetwork',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('igraph',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('khroma',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('gggenes',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('remotes',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('paletteer',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('rentrez',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('micropan',dependencies=TRUE, repos='http://cran.rstudio.com/')"
RUN R -e "install.packages('svglite',dependencies=TRUE, repos='http://cran.rstudio.com/')"

# Install from Bioc
RUN R -e "BiocManager::install('ggtree')"
RUN R -e "BiocManager::install('ggtreeExtra')"
RUN R -e "BiocManager::install('ggmsa')"
RUN R -e "BiocManager::install('msa')"

# Create Volume directory
RUN mkdir Volumes