# Clinical NGS Pipeline (Nextflow DSL2 + Docker)

## Recruiter Summary

A reproducible Nextflow DSL2 workflow that processes paired-end NGS data from FASTQ files through quality control, alignment, variant calling, and reporting.

This project was developed to build hands-on experience with workflow orchestration, containerized execution, and integration of commonly used bioinformatics tools. It demonstrates modular pipeline development using Nextflow DSL2 and Docker while following a typical NGS analysis workflow from raw sequencing data to variant calls.

## What This Project Demonstrates

* Building modular workflows using Nextflow DSL2
* Containerized execution using Docker
* Processing paired-end sequencing data from FASTQ to VCF
* Integration of FastQC, BWA-MEM, samtools, bcftools, and MultiQC
* Automated quality control and reporting workflows
* Reproducible execution through workflow automation

## Workflow Architecture

![Clinical NGS Workflow Architecture](docs/clinical-ngs-workflow-architecture.png)

## Key Features

* Modular Nextflow DSL2 pipeline architecture
* Docker-based reproducible execution
* Paired-end FASTQ processing
* Automated QC generation and aggregation
* Variant calling using bcftools
* Sample-sheet driven workflow inputs
* MultiQC reporting for workflow-level review

## Inputs

### Samplesheet (CSV)

```csv
sample,fastq_1,fastq_2
sample1,data/sample_1.fastq.gz,data/sample_2.fastq.gz
```

### Reference Genome

```text
data/reference.fasta
```

## Execution

### Build Container

```bash
docker build -t ngs-pipeline:1.0 .
```

### Run Pipeline

```bash
nextflow run workflow/main.nf \
  -profile docker \
  --samplesheet data/samplesheet.csv \
  --ref data/reference.fasta
```

## Outputs

* FastQC reports
* Sorted and indexed BAM files
* VCF variant calls
* QC classification summaries
* MultiQC aggregated report

## Technologies Used

**Nextflow (DSL2)** • **Docker** • **FastQC** • **MultiQC** • **BWA-MEM** • **samtools** • **bcftools**

## Design Goals

This project focuses on workflow automation concepts commonly used in bioinformatics environments, including:

* Structured ingestion of sequencing data
* Automated quality control
* Deterministic alignment and variant calling
* Reproducible containerized execution
* Workflow modularity and scalability

## Author

**Shiloh Cadere**
Bioinformatics Analyst specializing in genomics QC, data validation, and workflow development.
