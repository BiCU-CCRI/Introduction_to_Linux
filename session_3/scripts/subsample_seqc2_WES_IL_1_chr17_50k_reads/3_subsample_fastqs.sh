#!/usr/bin/env bash
set -euo pipefail

if [[ $# -ne 3 ]]; then
  echo "Usage: $0 <R1.fastq.gz> <R2.fastq.gz> <n_subsample>" >&2
  exit 1
fi

# seqkit not available via CeMM module system
# micromamba create -n fastqtools -c bioconda -c conda-forge seqkit
# micromamba activate fastqtools

R1="$1"
R2="$2"
N="$3"
SEED=22

log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >&2
}

if ! [[ "$N" =~ ^[0-9]+$ ]]; then
  log "ERROR: n_read_pairs must be a positive integer"
  exit 1
fi

if [[ "$N" -le 1000 ]]; then
  log "ERROR: n_read_pairs must be > 1000"
  exit 1
fi

if ! [[ "$N" =~ 000$ ]]; then
  log "ERROR: n_read_pairs must end in 000, e.g. 5000, 50000, 150000"
  exit 1
fi

N_LABEL="$((N / 1000))k"

og() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >&2
}

R1_BASE="$(basename "$R1")"
R2_BASE="$(basename "$R2")"

if [[ "$R1_BASE" != *_R1.fastq.gz ]]; then
  log "ERROR: R1 must end with _R1.fastq.gz"
  exit 1
fi

if [[ "$R2_BASE" != *_R2.fastq.gz ]]; then
  log "ERROR: R2 must end with _R2.fastq.gz"
  exit 1
fi

PREFIX="${R1_BASE%_R1.fastq.gz}"
OUT_PREFIX="${PREFIX}_${N_LABEL}"

TMP_R1="${OUT_PREFIX}.tmp.sampled_R1.fastq.gz"
READNAMES="${OUT_PREFIX}.readnames.txt"
OUT_R1="${OUT_PREFIX}_R1.fastq.gz"
OUT_R2="${OUT_PREFIX}_R2.fastq.gz"

log "Input R1: $R1"
log "Input R2: $R2"
log "Output prefix: $OUT_PREFIX"
log "Subsample count: $N read pairs"
log "Seed: $SEED"

log "Sampling exactly $N reads from R1"
seqkit sample -n "$N" -s "$SEED" "$R1" -o "$TMP_R1"

log "Extracting sampled read IDs"
seqkit seq -n -i "$TMP_R1" > "$READNAMES"

READNAME_COUNT="$(wc -l < "$READNAMES")"
log "Sampled read names: $READNAME_COUNT"

if [[ "$READNAME_COUNT" -ne "$N" ]]; then
  log "ERROR: sampled $READNAME_COUNT read names, expected $N"
  exit 1
fi

log "Subsetting R1"
seqkit grep -f "$READNAMES" "$R1" -o "$OUT_R1"

log "Subsetting R2"
seqkit grep -f "$READNAMES" "$R2" -o "$OUT_R2"

log "Checking output read counts"
R1_COUNT="$(zcat "$OUT_R1" | awk 'END{print NR/4}')"
R2_COUNT="$(zcat "$OUT_R2" | awk 'END{print NR/4}')"

log "Output R1 reads: $R1_COUNT"
log "Output R2 reads: $R2_COUNT"

if [[ "$R1_COUNT" -ne "$N" ]]; then
  log "ERROR: R1 output has $R1_COUNT reads, expected $N"
  exit 1
fi

if [[ "$R2_COUNT" -ne "$N" ]]; then
  log "ERROR: R2 output has $R2_COUNT reads, expected $N"
  log "This usually means R1/R2 read IDs do not match exactly."
  exit 1
fi

log "Output file sizes"
ls -lh "$OUT_R1" "$OUT_R2" "$READNAMES" >&2

log "Removing temporary file"
rm -f "$TMP_R1"

log "Done"
echo "$OUT_R1"
echo "$OUT_R2"
echo "$READNAMES"