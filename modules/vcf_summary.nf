process VCF_SUMMARY {

    tag "$sample"

    publishDir "${params.outdir}/vcf_summary", mode: 'copy'

    input:
    tuple val(sample), path(vcf)

    output:
    tuple val(sample), path("${sample}_vcf_summary.txt")

    script:
    """
    echo "VCF summary for sample: ${sample}" > ${sample}_vcf_summary.txt
    echo "VCF file: ${vcf}" >> ${sample}_vcf_summary.txt
    echo "Variant records:" >> ${sample}_vcf_summary.txt
    grep -vc '^#' ${vcf} >> ${sample}_vcf_summary.txt
    """
}
