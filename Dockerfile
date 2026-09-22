FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y \
    wget \
    curl \
    git \
    build-essential \
    openjdk-11-jre \
    unzip \
    bwa \
    samtools \
    bcftools \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

# FastQC
RUN wget https://www.bioinformatics.babraham.ac.uk/projects/fastqc/fastqc_v0.12.1.zip \
    && unzip fastqc_v0.12.1.zip \
    && chmod +x FastQC/fastqc \
    && ln -s /FastQC/fastqc /usr/local/bin/fastqc \
    && rm fastqc_v0.12.1.zip

# MultiQC
RUN apt-get update && apt-get install -y python3 python3-pip \
    && pip3 install --no-cache-dir multiqc \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR /pipeline
