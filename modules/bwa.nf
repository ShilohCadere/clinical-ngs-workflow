process BWA_INDEX {

    tag "reference"

    input:
    path ref

    output:
    tuple path(ref),
          path("${ref}.amb"),
          path("${ref}.ann"),
          path("${ref}.bwt"),
          path("${ref}.pac"),
          path("${ref}.sa")

    script:
    """
    bwa index ${ref}
    """
}


process BWA_ALIGN {

    tag "$sample"

    input:
    tuple val(sample), path(fastq1), path(fastq2)
    tuple path(ref), path(amb), path(ann), path(bwt), path(pac), path(sa)

    output:
    tuple val(sample), path("${sample}.sam")

    script:
    """
    bwa mem ${ref} ${fastq1} ${fastq2} > ${sample}.sam
    """
}
