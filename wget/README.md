# wget exercise files

This branch (`21-create-wget-branch-to-host-files-for-exercises`) is intentionally kept **unmerged**. Its only purpose is to host static files on GitHub so that course attendees have stable permalinks to practice `wget` and `md5sum` against. Do not merge this branch into `main`.

## How attendees will use this

During the session, attendees will:

1. Use `wget` to download one or more files from this branch via their raw GitHub permalinks.
2. Use `md5sum` to verify the downloaded file's checksum against the corresponding `.md5` file also hosted here.
3. Confirm the checksums match, demonstrating that the file downloaded correctly and completely.

## Files

### Session 2 — [`files/session2/`](files/session2)

| File | Description |
| --- | --- |
| `sample_1.txt` | Exercise file |
| `sample_2.txt` | Exercise file |
| `sample_3.txt` | Exercise file |
| `checksums.md5` | MD5 checksums for all three exercise files (`md5sum -c checksums.md5`) |

**Download links (permalinks):**
- `sample_1.txt`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/abc67ba8f3c6927ab6c03297bd8f0e79dbe4185b/wget/files/session2/sample_1.txt
- `sample_2.txt`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/abc67ba8f3c6927ab6c03297bd8f0e79dbe4185b/wget/files/session2/sample_2.txt
- `sample_3.txt`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/abc67ba8f3c6927ab6c03297bd8f0e79dbe4185b/wget/files/session2/sample_3.txt
- `checksums.md5`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/abc67ba8f3c6927ab6c03297bd8f0e79dbe4185b/wget/files/session2/checksums.md5

### Session 3 — [`files/session3/`](files/session3)

| File | Description |
| --- | --- |
| `mendel.txt` | Exercise file |
| `mendel.txt.md5` | MD5 checksum for `mendel.txt` (`md5sum -c mendel.txt.md5`) |
| `mendel_parts.zip` | More exercise files |

**Download links (permalinks):**
- `mendel.txt`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/abc67ba8f3c6927ab6c03297bd8f0e79dbe4185b/wget/files/session3/mendel.txt
- `mendel.txt.md5`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/abc67ba8f3c6927ab6c03297bd8f0e79dbe4185b/wget/files/session3/mendel.txt.md5
- `mendel_parts.zip`: https://github.com/BiCU-CCRI/Introduction_to_Linux/blob/8401f83ab9ad339c1f6938b6ff4e9faa3d738a5e/wget/files/session3/mendel_parts.zip

### Session 4 — [`files/session4/`](files/session4)

| File | Description |
| --- | --- |
| `session4_R1.fastq.gz` | Exercise file (FASTQ, read 1) |
| `session4_R1.fastq.gz.md5` | MD5 checksum for `session4_R1.fastq.gz` (`md5sum -c session4_R1.fastq.gz.md5`) |
| `session4_R2.fastq.gz` | Exercise file (FASTQ, read 2) |
| `session4_R2.fastq.gz.md5` | MD5 checksum for `session4_R2.fastq.gz` (`md5sum -c session4_R2.fastq.gz.md5`) |
| `WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz` | Exercise file (bgzipped VCF) |
| `WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz.tbi` | Tabix index for the VCF above |
| `checksums.md5` | MD5 checksums for the VCF and its index (`md5sum -c checksums.md5`) |

**Download links (permalinks):**
- `session4_R1.fastq.gz`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/session4_R1.fastq.gz
- `session4_R1.fastq.gz.md5`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/session4_R1.fastq.gz.md5
- `session4_R2.fastq.gz`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/session4_R2.fastq.gz
- `session4_R2.fastq.gz.md5`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/session4_R2.fastq.gz.md5
- `WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz
- `WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz.tbi`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz.tbi
- `checksums.md5`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/2c36b8f74b28d95a118f4ccaa35791aff2e9231c/wget/files/session4/checksums.md5

## Example workflow

```bash
# Download a file
wget <permalink-to-file>

# Download its checksum file
wget <permalink-to-checksum-file>

# Verify the download
md5sum -c checksums.md5
# or, for a single file/checksum pair:
md5sum -c mendel.txt.md5
```

A successful check prints `OK` next to the filename. If the file is corrupted or incomplete, `md5sum` reports `FAILED`.
