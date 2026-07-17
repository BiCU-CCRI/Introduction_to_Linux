# Session 4
## Working with Compressed Genomics Files

---

## Overview

Today we'll cover:

1. Recap of Session 3
2. **Exercise 1: Download and Verify**
3. **Exercise 2: A First Look at FASTQ and VCF**
4. **Exercise 3: Unzipping Files**
5. **Exercise 4: Reading Compressed Files Directly**
6. **Exercise 5: Piping zcat**
7. **Exercise 6: Re-compressing**
8. Wrap-up

---

## Tasks

### Exercise 1: Download and Verify

**Goal:** Download the FASTQ and VCF files for this session, along with their checksums.

**Before you start:** `cd session_4`

**1.** Download the FASTQ files:
```
https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/session4_R1.fastq.gz
https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/session4_R2.fastq.gz
https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/session4_R1.fastq.gz.md5
https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/session4_R2.fastq.gz.md5
```

**2.** Download the VCF file:
```
https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz  
https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz.tbi  
```

**3.** Download the checksums file:
```
https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/8028efcbd6062097c9b2fa2997d6205369c8a7a6/wget/files/session4/checksums.txt
```

**4.** Verify the checksums using `md5sum`:

---

### Exercise 2: A First Look at FASTQ and VCF

**Goal:** Try your Session 3 tools on these files and see what happens.

**1.** Look at the start of the FASTQ file:
```
head session4_R1.fastq.gz
```
Does this look like readable text?

**2.** Try `less session4_R1.fastq.gz`. Does it look any better? Quit with `q`.

### Exercise 3: Unzipping Files

**Goal:** Decompress the gzipped files

**1.** Decompress the FASTQ files:
```
gunzip session4_R*.fastq.gz
```

**2.** Check what's in the folder now: `ls -lh`. Is `session4_R2.fastq.gz` still there?

**3.** Now decompress the VCF file, but with `gunzip -k`, what did it do?
```
gunzip -k WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz
```

**4.** Check the folder again: `ls -lh`. Look at the difference in file sizes.

**5.** Try `head` and `less` again on both decompressed files:
```
head session4_R1.fastq
less WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf
```

**You are done when:**
- `session4_R1.fastq` exists and is readable with `head`
- Both `WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf` and `WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz` exist
- You can explain the difference between plain `gunzip` and `gunzip -k`

---

### Exercise 4: Reading Compressed Files Directly

**Goal:** Look inside a compressed file without decompressing it to disk at all.

**1.** Open the compressed VCF directly:
```
zless WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz
```
Navigate with the arrow keys, same as `less`. Quit with `q`.

**2.** VCF lines can be very long. Try the same file with line-wrap turned off:
```
zless -S WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz
```

**You are done when:**
- You can open `WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz` with `zless` and navigate it
- You can explain the difference between `zless` and `zless -S`

---

### Exercise 5: Piping zcat

**Goal:** Combine `zcat` with tools you already know to answer questions about the compressed VCF, without ever decompressing it to disk.

**1.** Count the total number of lines in the compressed file:
```
zcat WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz | wc -l
```

**2.** Print the first few lines to the screen without opening a reader:
```
zcat session4_R1.fastq.gz | head
```

**3.** Print the last lines to the screen without opening a reader:
```
zcat session4_R1.fastq.gz | tail
```
Do you notice a difference to `head`?

**4.** Did you notice how VCF files are structured? How would you go about counting number of variants?

**5.** Search for a specific value inside the compressed file - for example, lines marked `PASS`:
```
zcat WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz | grep "PASS" | wc -l
```

**6.** Write just the header lines out to their own file, still without decompressing anything to disk:
```
zcat WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz | grep "#" > vcf_header.txt
```
Check it: `cat vcf_header.txt`.

**You are done when:**
- You can report the total line count, the data-line count, and the header-line count for `WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz`
- `vcf_header.txt` exists and contains only the header lines
- At no point in this exercise did you create a decompressed copy of the VCF on disk

---

### Exercise 6: Re-compressing

**Goal:** Return the FASTQ file to its original compressed state.

**1.** Compress the FASTQ file you unzipped in Exercise 3:
```
gzip session4_R*.fastq
```

**2.** Confirm the result: `ls -lh`. Are `session4_R1.fastq.gz` and `session4_R2.fastq.gz` back, and are the plain `.fastq` versions gone?

**3.** Even though a `.gz` file is binary, it's still structured with a defined start and end - so two gzipped FASTQ files can be concatenated directly, and once decompressed, the combined file's order and logic will be exactly as valid as if you'd concatenated the uncompressed originals. 
This is relevant when combining "laned" sequencing data
```
cat file_L1_R1.fastq.gz file_L2_R1.fastq.gz > file_merged_R1.fastq.gz
```
is as valid as
```
cat file_L1_R1.fastq file_L2_R1.fastq > file_merged_R1.fastq
```

---

## Cheat Sheet

| Command | What it does |
|---|---|
| `gunzip file.gz` | Decompress a file (original `.gz` is removed) |
| `gunzip --keep file.gz` / `gunzip -k file.gz` | Decompress, keeping the compressed original too |
| `gzip file` | Compress a file (original is removed) |
| `zless file.gz` | Open a compressed file in a reader, like `less` |
| `zless -S file.gz` | Same, but without line-wrapping - scroll sideways |
| `zcat file.gz` | Print a compressed file's contents, like `cat` |
| `zcat file.gz \| command` | Pipe a compressed file's contents into another command |
| `bgzip file` | Block-compress a file (needed for indexing with `tabix`) |
| `tabix -p vcf file.vcf.gz` | Build a random-access index for a bgzipped VCF |

---

## Appendix A - New Commands in Session 4

| Command | What it does | Example |
|---|---|---|
| `gunzip file.gz` | Decompress a `.gz` file, replacing the original | `gunzip sample.fastq.gz` |
| `gunzip --keep file.gz` | Decompress, keeping the original `.gz` | `gunzip --keep sample.vcf.gz` |
| `gzip file` | Compress a file, replacing it | `gzip sample.fastq` |
| `zless file.gz` | Read a compressed file interactively | `zless sample.vcf.gz` |
| `zless -S file.gz` | Read a compressed file without line-wrap | `zless -S sample.vcf.gz` |
| `zcat file.gz` | Print a compressed file's contents to the screen | `zcat sample.vcf.gz` |
| `bgzip file` | Block-compress a file for use with `tabix` | `bgzip sample.vcf` |
| `tabix -p vcf file.vcf.gz` | Build an index for a bgzipped VCF | `tabix -p vcf sample.vcf.gz` |
| `file filename` | Report what type of file something actually is | `file sample.fastq.gz` |

---

## Appendix B - Sessions 1-3 Quick Reference

| Command | What it does |
|---|---|
| `pwd` / `ls -lh` | Where am I? / What is here? |
| `cd folder` / `cd ..` | Enter a directory / go up one level |
| `mkdir name` / `touch file` | Create a directory / create an empty file |
| `echo "text" > file` / `>>` | Write to a file (overwrite / append) |
| `cat file` | Read a file |
| `wget URL` | Download a file |
| `md5sum -c file.md5` | Verify files against a checksums file |
| `mv old new` / `cp file copy` | Rename or move a file / copy a file |
| `wc -l file` | Count the lines in a file |
| `head file` / `tail file` | Show the first / last 10 lines |
| `less file` | Open a file in a safe, read-only reader |
| `grep "word" file` | Print lines containing "word" |
| `command1 \| command2` | Pipe: send the output of one command into another |

---

## Appendix C - Troubleshooting Reference

| Error or symptom | Cause | Fix |
|---|---|---|
| `head`/`tail`/`less`/`cat` show unreadable characters | File is compressed (`.gz`) | Use `zless`/`zcat`, or `gunzip` it first |
| `wc -l` on a `.gz` file gives a strange number | Counting compressed bytes, not text lines | Use `zcat file.gz \| wc -l` instead |
| `gzip: file already exists` | A file with the target name is already present | Remove or rename the existing file first, or use `gzip -f` to force overwrite |
| Original `.gz` disappeared after `gunzip` | Default behaviour - `gunzip` removes the compressed file | Use `gunzip --keep` next time if you need both versions |
| `bgzip: command not found` | `bgzip` isn't installed in this environment | Check with your instructor; `gzip` still works for general compression |
| `tabix` fails with a format-related error | File was compressed with plain `gzip`, not `bgzip` | Re-create the archive with `bgzip` before indexing |
| `.tbi` index seems out of date | The `.vcf.gz` file was changed after indexing | Re-run `tabix -p vcf` on the current file |

## Optional Content

### Bgzipping and Indexing a VCF 

**Goal:** Produce a properly `bgzip`-compressed VCF and build an index that allows random access to specific regions.

**Before you start:** You'll need an uncompressed `.vcf` to start from. If you removed it in Exercise 3, recreate it first:

    gunzip --keep WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz

**1.** Compress the plain VCF with `bgzip` instead of `gzip`:
```
bgzip WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf
```
Check the result with `ls -lh` - notice the file is a `.gz` again, but produced differently than in Exercise 6.

**2.** Build an index for it:
```
tabix -p vcf WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz
```

**3.** Check what was created: `ls -lh`. You should see a new file ending in `.tbi`.

**You are done when:**
- `WES_IL_T_1_vs_WES_IL_N_1.mutect2.filtered_VEP.ann.chr17.vcf.gz` exists as a `bgzip`-compressed file
- A matching `.tbi` index file exists alongside it

**Extension - if you finish early:**
- Try running `tabix -p vcf` on a VCF that was compressed with plain `gzip` instead of `bgzip`. Read the error - what does it tell you?

