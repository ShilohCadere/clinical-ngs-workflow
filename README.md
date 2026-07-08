# Clinical NGS Workflow

## At a Glance

- End-to-end Nextflow DSL2 workflow processing paired-end sequencing data from FASTQ to VCF.
- Integrates quality control, alignment, variant calling, and aggregated reporting.
- Demonstrates modular workflow orchestration, containerized execution, and reproducible bioinformatics pipelines.
- Models a production-style sequencing workflow using simulated demonstration data.

---

## Overview

Clinical NGS Workflow is a portfolio project that models the computational processing stage of an NGS analysis pipeline. Beginning with paired-end FASTQ files, the workflow performs sequencing quality control, alignment, variant calling, and report aggregation using commonly adopted bioinformatics tools orchestrated through Nextflow DSL2.

The repository emphasizes workflow architecture, reproducible execution, and modular software design commonly found in production bioinformatics environments while using simulated data for demonstration purposes.

---

## Why This Project Exists

Modern sequencing analysis depends on coordinating multiple bioinformatics tools into reproducible workflows. Individual software packages perform specific analytical tasks, but workflow orchestration is responsible for connecting those stages into a reliable, repeatable pipeline.

This project demonstrates that orchestration process.

Using Nextflow DSL2 and Docker, the workflow automates sequencing quality control, alignment, variant calling, and reporting while maintaining clear separation between individual processing stages.

The focus is not developing new analytical algorithms. Instead, the project demonstrates reproducible workflow design, modular pipeline architecture, and containerized execution within a representative NGS processing workflow.

---

## Workflow Architecture

Clinical NGS Workflow models the computational processing performed after sequencing data has been generated. Each analytical stage is implemented as an independent workflow module to improve readability, maintainability, and reproducibility.

```
Samplesheet
      │
      ▼
FASTQ Input
      │
      ▼
FastQC
      │
      ▼
BWA-MEM Alignment
      │
      ▼
samtools Sort / Index
      │
      ▼
bcftools Variant Calling
      │
      ▼
MultiQC Report
```

---

## Repository Structure

```
clinical-ngs-workflow/
├── workflow/          # Nextflow DSL2 workflow definition
├── modules/           # Individual pipeline processes
├── data/              # Example sequencing inputs
├── outputs/           # Generated workflow outputs
├── Dockerfile
└── nextflow.config
```

The repository is organized around workflow responsibilities rather than individual software tools. Each module performs one stage of the sequencing pipeline, allowing quality control, alignment, variant calling, and reporting to evolve independently while keeping workflow logic modular and maintainable.

---

## Current Capabilities

Current functionality includes:

- Loading paired-end sequencing data through a sample sheet.
- Performing sequencing quality assessment with FastQC.
- Aligning sequencing reads using BWA-MEM.
- Sorting and indexing BAM files using samtools.
- Calling sequence variants using bcftools.
- Aggregating workflow quality reports with MultiQC.
- Executing reproducibly through Docker and Nextflow DSL2.

---

## Example Inputs

Example datasets are included to demonstrate the complete sequencing workflow.

### Samplesheet

- Sample identifier
- Paired FASTQ file locations

### Sequencing Data

- Paired-end FASTQ files
- Reference genome

These example datasets are provided solely to demonstrate workflow execution and do not represent clinical sequencing data or proprietary laboratory outputs.

---

## Execution

Install project dependencies:

```bash
docker build -t ngs-pipeline:1.0 .
```

Run the workflow:

```bash
nextflow run workflow/main.nf \
    -profile docker \
    --samplesheet data/samplesheet.csv \
    --ref data/reference.fasta
```

---

## Example Outputs

Successful execution generates workflow outputs for downstream analysis.

### FastQC Reports

Per-sample sequencing quality metrics.

### Sorted BAM Files

Coordinate-sorted alignments with accompanying BAM indexes.

### Variant Calls (VCF)

Sequence variants identified by bcftools.

### MultiQC Report

Aggregated quality metrics summarizing workflow execution across all processed samples.

The generated outputs demonstrate reproducible workflow execution rather than clinical interpretation.

---

## Design Decisions

Several architectural decisions intentionally shape this project.

### Modular Workflow Design

Each analytical stage is implemented as an independent Nextflow process. This keeps responsibilities well-defined while allowing workflow components to evolve independently.

### Containerized Execution

Docker provides a reproducible software environment so identical inputs generate consistent analytical outputs across systems.

### Sample Sheet Driven Inputs

Sample metadata is separated from workflow logic, allowing new sequencing datasets to be processed without modifying pipeline code.

### Workflow Automation

Nextflow coordinates execution while managing dependencies between analytical stages, demonstrating scalable workflow orchestration commonly used in bioinformatics production environments.

---

## Testing

This project emphasizes reproducible workflow execution through deterministic pipeline stages rather than Python unit testing.

Individual workflow modules can be executed repeatedly using identical inputs to verify consistent analytical outputs throughout the pipeline.

---

## Future Improvements

Planned future development includes:

- Integrating downstream analytical review through the companion Clinical NGS Review repository.
- Expanding workflow support for additional sequencing analyses.
- Increasing workflow configurability while preserving modular architecture.
- Continuing to improve reproducibility and maintainability as analytical capabilities grow.

Future development will continue to prioritize workflow architecture, reproducible execution, and modular software design over feature quantity.

---

## Technologies Used

Nextflow (DSL2) • Docker • FastQC • MultiQC • BWA-MEM • samtools • bcftools

---

## Author

**Shiloh Cadere**

Bioinformatics analyst focused on genomics QC, analytical review, workflow development, and reproducible bioinformatics software.
