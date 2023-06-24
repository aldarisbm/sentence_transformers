FROM continuumio/miniconda3:latest
 
# set working directory
WORKDIR /app

# copy project
COPY main.py environment.yml ./

# install system dependencies
RUN apt-get update
RUN apt-get install curl -y 
RUN conda update --all -y
RUN conda env create -f environment.yml
RUN apt-get clean

EXPOSE 5000

CMD ["/opt/conda/bin/conda", "activate", "&&", "env", " RUN", "flask", "--app", "main", "run"]
