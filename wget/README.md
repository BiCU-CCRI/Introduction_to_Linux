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

**Download links (permalinks):**
- `mendel.txt`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/abc67ba8f3c6927ab6c03297bd8f0e79dbe4185b/wget/files/session3/mendel.txt
- `mendel.txt.md5`: https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/abc67ba8f3c6927ab6c03297bd8f0e79dbe4185b/wget/files/session3/mendel.txt.md5

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
