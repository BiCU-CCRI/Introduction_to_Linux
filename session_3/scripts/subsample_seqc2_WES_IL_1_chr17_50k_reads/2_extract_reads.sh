#!/bin/bash
set -euo pipefail

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >&2
}

BAM="$1"
REGION="$2"

log "Starting script"
log "Input BAM: ${BAM}"
log "Target region: ${REGION}"

BAM_BASE="$(basename "$BAM")"
log "BAM basename: ${BAM_BASE}"

# Remove common BAM suffixes
SAMPLE="${BAM_BASE%.bam}"
SAMPLE="${SAMPLE%.sorted}"
SAMPLE="${SAMPLE%.md}"
SAMPLE="${SAMPLE%.recal}"

OUT="${SAMPLE}.${REGION}"

log "Sample name: ${SAMPLE}"
log "Output prefix: ${OUT}"

module load SAMtools/1.18-GCC-12.3.0

log "Counting alignments in region"
REGION_COUNT="$(samtools view -c "$BAM" "$REGION")"
log "Alignments in ${REGION}: ${REGION_COUNT}"

log "Extracting unique read names from region"
samtools view "$BAM" "$REGION" | \
awk '{print $1}' | \
sort -u > "${OUT}.readnames.txt"

READNAME_COUNT="$(wc -l < "${OUT}.readnames.txt")"
log "Unique read names written to ${OUT}.readnames.txt: ${READNAME_COUNT}"

log "Extracting all BAM records matching read names"
samtools view -N "${OUT}.readnames.txt" \
  -b "$BAM" \
  -o "${OUT}.bam"

log "Output BAM created: ${OUT}.bam"
log "Output BAM size:"
ls -lh "${OUT}.bam" >&2

log "Name-sorting extracted BAM before FASTQ conversion"
samtools sort -n -@ 8 \
  -o "${OUT}.namesorted.bam" \
  "${OUT}.bam"

log "Converting BAM to FASTQ"
samtools fastq -@ 8 -n \
  -1 "${OUT}_R1.fastq.gz" \
  -2 "${OUT}_R2.fastq.gz" \
  -0 /dev/null \
  -s "${OUT}_singletons.fastq.gz" \
  "${OUT}.namesorted.bam"

log "FASTQ files created:"
ls -lh "${OUT}_R1.fastq.gz" "${OUT}_R2.fastq.gz" "${OUT}_singletons.fastq.gz" >&2

log "BAM record count:"
samtools view -c "${OUT}.bam" >&2

log "READ1 records:"
samtools view -c -f 64 "${OUT}.bam" >&2

log "READ2 records:"
samtools view -c -f 128 "${OUT}.bam" >&2

log "Paired records:"
samtools view -c -f 1 "${OUT}.bam" >&2

log "Records with mate unmapped:"
samtools view -c -f 8 "${OUT}.bam" >&2

log "Finished successfully"
