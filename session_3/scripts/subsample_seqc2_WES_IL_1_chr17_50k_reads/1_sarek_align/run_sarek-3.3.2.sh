#!/bin/bash

#SBATCH --time=02-00:00:00
#SBATCH --job-name=nfcore_sarek-3.3.2
#SBATCH --partition=mediumq
#SBATCH --qos=mediumq
#SBATCH --cpus-per-task=1
#SBATCH --ntasks=1
#SBATCH --mem-per-cpu=2G

# Apptainer cache directory
NXF_SINGULARITY_CACHEDIR=/research/lab_ccri_bicu/public/pipelines/nf-core-sarek/3.3.2/singularity-images
export NXF_SINGULARITY_CACHEDIR=$NXF_SINGULARITY_CACHEDIR

# java virtual machines are started with 1 GB of mem and can reach a maximum of 64 GB
NXF_OPTS='-Xms1g -Xmx64g'
export NXF_OPTS=$NXF_OPTS

# nextflow config
nextflow_config=/research/lab_ccri_bicu/public/pipelines/nf-core-sarek/3.3.2/configs/conf/cemm_v0.17.config

# Paths to reference files
ref_dir=/research/lab_ccri_bicu/public/references/genomes/igenomes/2023-10-13
fasta=/research/lab_ccri_bicu/public/references/genomes/igenomes/2023-10-13/Homo_sapiens/GATK/GRCh38/Sequence/WholeGenomeFasta/Homo_sapiens_assembly38.fasta

vep_dir=/research/lab_ccri_bicu/public/references/vep/v110
spliceai_snv=/research/lab_ccri_bicu/public/references/spliceai/v1.3/spliceai_scores.raw.snv.hg38.vcf.gz
spliceai_snv_tbi=/research/lab_ccri_bicu/public/references/spliceai/v1.3/spliceai_scores.raw.snv.hg38.vcf.gz.tbi
spliceai_indel=/research/lab_ccri_bicu/public/references/spliceai/v1.3/spliceai_scores.raw.indel.hg38.vcf.gz
spliceai_indel_tbi=/research/lab_ccri_bicu/public/references/spliceai/v1.3/spliceai_scores.raw.indel.hg38.vcf.gz.tbi
dbnsfp=/research/lab_ccri_bicu/public/references/dbnsfp/v4.7a/dbNSFP4.7a_grch38.gz
dbnsfp_tbi=/research/lab_ccri_bicu/public/references/dbnsfp/v4.7a/dbNSFP4.7a_grch38.gz.tbi


# Load CeMM modules
module load Nextflow/23.04.1 || exit 1
module load apptainer/1.1.9 || exit 1

nextflow info -d > nextflow.info
nextflow run /research/lab_ccri_bicu/public/pipelines/nf-core-sarek/3.3.2/workflow/ \
    -with-trace trace.txt \
    -with-timeline timeline.html \
    -with-dag dag.pdf \
    -c ${nextflow_config} \
    -profile singularity \
     \
     \
    --input input.csv \
    --outdir ./results \
    --step mapping \
    --save_mapped \
     \
    --save_output_as_bam \
     \
    --vep_cache ${vep_dir} \
    --vep_include_fasta TRUE \
    --vep_custom_args "--everything --filter_common --per_gene --total_length --offline --format vcf --fasta ${fasta} --hgvs" \
    --vep_spliceai \
    --spliceai_snv ${spliceai_snv} \
    --spliceai_snv_tbi ${spliceai_snv_tbi} \
    --spliceai_indel ${spliceai_indel} \
    --spliceai_indel_tbi ${spliceai_indel_tbi} \
    --vep_dbnsfp \
    --dbnsfp ${dbnsfp} \
    --dbnsfp_tbi ${dbnsfp_tbi} \
    --dbnsfp_fields "rs_dbSNP,HGVSc_VEP,HGVSp_VEP,1000Gp3_EAS_AF,1000Gp3_AMR_AF,LRT_score,GERP++_RS,gnomAD_exomes_AF,CADD_raw,CADD_raw_rankscore,CADD_phred" \
     \
    --genome GATK.GRCh38 \
    --igenomes_base ${ref_dir} \
    --max_time '240.h' \
    --max_memory '64.GB' \
    --max_cpus 12 > run_sarek-3.3.2.out 2>&1
