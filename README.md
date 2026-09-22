# Clinical NGS Workflow

## At a Glance

- End-to-end Nextflow DSL2 workflow processing paired-end sequencing data from FASTQ to VCF.
- Integrates FastQC, BWA-MEM, samtools, bcftools, lightweight post-VCF summarization, and MultiQC.
- Demonstrates modular workflow orchestration, Docker-based execution, parameterized inputs, and reproducible bioinformatics processing.
- Uses demonstration data and is intended as a portfolio workflow rather than a clinical production pipeline.

## Overview

Clinical NGS Workflow models the computational processing stage of a sequencing analysis pipeline. Starting with paired-end FASTQ files, the workflow performs sequencing QC, alignment, BAM sorting and indexing, variant calling, simple variant-output summarization, and aggregated QC reporting.

The project emphasizes workflow organization, explicit process dependencies, containerized execution, and reproducible handling of sequencing inputs.

## Workflow

```text
Samplesheet
    |
    v
Paired FASTQ
    |
    +--> FastQC --------> MultiQC
    |
    v
BWA-MEM Alignment
    |
    v
samtools Sort / Index
    |
    v
bcftools Variant Calling
    |
    v
VCF Summary
```

## Repository Structure

```text
clinical-ngs-workflow/
├── main.nf                  # Main DSL2 workflow
├── nextflow.config          # Default parameters and Docker profile
├── modules/                 # Reusable Nextflow processes
│   ├── fastqc.nf
│   ├── bwa.nf
│   ├── samtools.nf
│   ├── bcftools.nf
│   ├── vcf_summary.nf
│   └── multiqc.nf
├── data/                    # Demonstration inputs
├── bin/                     # Supporting executable scripts, if used
├── docs/                    # Project documentation
├── Dockerfile               # Reproducible tool environment
└── README.md
```

## Current Capabilities

- Reads paired-end sample definitions from a CSV samplesheet.
- Runs FastQC on paired FASTQ files.
- Aligns reads to a reference with BWA-MEM.
- Converts, sorts, and indexes BAM files with samtools.
- Calls variants with bcftools.
- Produces a lightweight per-sample VCF summary.
- Aggregates FastQC results with MultiQC.
- Publishes organized outputs under a configurable output directory.
- Runs tools through a Docker image using the included Nextflow profile.

## Configuration

Default parameters are defined in `nextflow.config`:

```text
samplesheet = data/samplesheet.csv
ref         = data/reference.fasta
outdir      = results
```

They can be overridden at runtime with standard Nextflow parameters.

## Execution

Build the Docker image:

```bash
docker build -t ngs-pipeline:1.0 .
```

Run the bundled demonstration workflow:

```bash
nextflow run main.nf -profile docker
```

Run with custom inputs:

```bash
nextflow run main.nf \
    -profile docker \
    --samplesheet path/to/samplesheet.csv \
    --ref path/to/reference.fasta \
    --outdir results
```

## Outputs

Successful execution produces organized outputs including:

- FastQC reports
- Sorted and indexed BAM files
- VCF files
- Per-sample VCF summaries
- MultiQC report

## Design Decisions

### Modular DSL2 Processes

Each analytical stage is implemented as a separate process so reference indexing, alignment, sorting, variant calling, summarization, and reporting responsibilities remain distinct.

### Config-Driven Parameters

Workflow defaults live in `nextflow.config` rather than being duplicated in the workflow script. This keeps runtime configuration separate from orchestration logic.

### Explicit Dataflow Dependencies

MultiQC consumes FastQC outputs through a Nextflow channel rather than relying on a published output directory. This allows Nextflow to track execution order through data dependencies.

### Containerized Tooling

The Docker image provides BWA, samtools, bcftools, FastQC, and MultiQC in one reproducible environment.

## Current Limitations

This is a demonstration portfolio workflow, not a validated clinical pipeline. Current limitations include:

- The post-VCF summary is intentionally lightweight and is not a substitute for comprehensive variant QC.
- The workflow does not yet include automated integration tests or CI-based execution checks.
- Resource requests and executor-specific tuning are minimal.

## Future Improvements

- Add automated workflow testing with small deterministic datasets.
- Expand post-variant QC metrics.
- Add process-specific CPU and memory configuration.
- Integrate downstream analytical review with the companion Clinical NGS Review project.

## Technologies Used

Nextflow DSL2 • Docker • FastQC • MultiQC • BWA-MEM • samtools • bcftools

## Author

**Shiloh Cadere**

Bioinformatics analyst focused on genomics QC, analytical review, workflow development, and reproducible bioinformatics software.
