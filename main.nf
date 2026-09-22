nextflow.enable.dsl=2

include { FASTQC } from './modules/fastqc.nf'
include { BWA_ALIGN } from './modules/bwa.nf'
include { SORT_BAM } from './modules/samtools.nf'
include { CALL_VARIANTS } from './modules/bcftools.nf'
include { QC_CLASSIFY } from './modules/qc_classification.nf'
include { MULTIQC } from './modules/multiqc.nf'

workflow {

    samples = Channel
        .fromPath(params.samplesheet)
        .splitCsv(header: true)
        .map { row ->
            tuple(row.sample, file(row.fastq_1), file(row.fastq_2))
        }

    fastqc_out = FASTQC(samples)

    aligned  = BWA_ALIGN(samples, file(params.ref))
    sorted   = SORT_BAM(aligned)
    variants = CALL_VARIANTS(sorted, file(params.ref))
    QC_CLASSIFY(variants)

    // Feed FastQC outputs directly into MultiQC so Nextflow tracks the dependency.
    MULTIQC(fastqc_out.collect())

    log.info "Using samplesheet: ${params.samplesheet}"
    log.info "Using reference: ${params.ref}"
    log.info "Writing outputs to: ${params.outdir}"
}
