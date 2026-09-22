process BWA_ALIGN {

    tag "$sample"

    input:
    tuple val(sample), path(fastq1), path(fastq2)
    path ref

    output:
    tuple val(sample), path("${sample}.sam")

    script:
    """
    bwa index ${ref}
    bwa mem ${ref} ${fastq1} ${fastq2} > ${sample}.sam
    """
}
