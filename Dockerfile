FROM rocker/rstudio:4.3.1

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

# Install from Bioc
RUN R -e "BiocManager::install('ggtree')"
RUN R -e "BiocManager::install('ggtreeExtra')"


# Install from Github
RUN R -e "remotes::install_github('YTLogos/gggenes')"

# Create Volume file
RUN mkdir Volumes

# install libxt6
RUN apt-get -y update; apt-get install -y libxt6
RUN apt-get update && apt-get install -y wget
RUN wget "https://github.com/shenwei356/seqkit/releases/download/v2.5.1/seqkit_linux_arm64.tar.gz" -O /tmp/seqkit.tar.gz && \
	tar zxvf /tmp/seqkit.tar.gz -C /usr/bin/ && rm /tmp/seqkit.tar.gz