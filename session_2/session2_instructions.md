# Session 2 - Participant Handout
## Intro to Linux: Working with Files

---

## Overview

Today we'll cover:

1. **Exercise 1: Refresher**
2. Downloading files with `wget`
3. **Exercise 2 - Part A: Download**
4. Verifying files with `md5sum`
5. **Exercise 2 - Part B: Verify**
6. *Break*
7. Combining & organizing files
8. **Exercise 3: Combine & Organize**
9. Wildcards
10. **Exercise 4: Wildcards**
11. Wrap-up

---

## Important Notes

- **`pwd` before you download.** Wherever you are when you run `wget` is where the downloaded file lands.
- **A checksum is a fingerprint, not a password.** You never need to memorize or type one - you just compare "does it say OK or FAILED." 
    - Note: There are two common forms: a batch file (`checksums.md5` covering several files) and a single-file companion (`file.txt.md5` covering just one) - you'll see both.
- **Never redirect into a file you're reading from.** `cat file1 file2 > file1` empties `file1` before `cat` even reads it. Always redirect to a **new** file.
- **`mv` moves - the original is gone** while **`cp` copies - the original stays**. Neither warns you before overwriting an existing file.
- **Wildcards are expanded by the shell, not the command.** `*` matches any number of any characters; `?` matches exactly one. `ls` with your wildcard pattern **before** running `mv` or `rm` with it - always check what it actually matches before doing anything potentially harmful.

---

## Tasks

### Exercise 1: Refresher

**Goal:** Confirm you can apply Session 1 commands without help. Try to recall everything from your memory before reaching for the cheat sheet or looking back - list a directory, move to a directory and back, view the file content, print some text to the screen, save text to a file.

**Start here - navigate to `session2`:**
```
cd /workspaces/Introduction_to_Linux/session_2/
pwd
```

**1.** What is your current location?

**2.** What is the content of this folder?

**3.** Create a directory called `my_work` inside `session2`.

**4.** Navigate into `my_work`.

**5.** Create an empty file called `log.txt`.

**6.** Write this line `first entry` into `log.txt`.

**7.** Add the line `second entry` to `log.txt` without overwriting the first line.

**8.** Add a third line of your choice.

**9.** Read the full contents of `log.txt`. How many lines do you see?

**10.** Navigate back to `session2` and confirm your location.

**11.** Without entering the `my_work` directory, list its contents.

**You are done when:**
- `cat log.txt` shows all three lines
- You are back in `session2` confirmed with `pwd`
- `ls my_work` shows `log.txt`

**Extension - if you finish early:**
- Run `cat log.txt log.txt > double.txt` inside `my_work`. What does `double.txt` contain? Why?
- From `session2`, run `ls -lh my_work`. What information does each column show?

---

### Exercise 2, Download

**Goal:** Download all three sample files and the checksums file using `wget`.

**Before you start:** Run `pwd` - confirm you're in `session2`.

**1.** Download the first sample file:
```
wget https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/refs/heads/21-create-wget-branch-to-host-files-for-exercises/wget/files/session2/sample_1.txt
```

**2.** Confirm it is downloaded and not empty: `ls -l`

**3.** Download the second and the third file:
```
wget https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/refs/heads/21-create-wget-branch-to-host-files-for-exercises/wget/files/session2/sample_2.txt

wget https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/refs/heads/21-create-wget-branch-to-host-files-for-exercises/wget/files/session2/sample_3.txt
```

**4.** Download the checksums file:
```
wget https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/refs/heads/21-create-wget-branch-to-host-files-for-exercises/wget/files/session2/checksums.md5
```

**5.** Confirm all four files are present: `ls -lh` - you should see `sample_1.txt`, `sample_2.txt`, `sample_3.txt`, and `checksums.md5`.

**6.** Look at the checksums file: `cat checksums.md5` - what does it contain? 

**You are done when:**
- `ls` shows all four files in `session2`
- `cat checksums.md5` shows three lines of text

**Extension - if you finish early:**
- Download `sample_1.txt` again, but add `-O sample_1_copy.txt` before the URL in the `wget` command. What happened? Does the original `sample_1.txt` still exist?
- What happens if you download the same file twice without using `-O`? Try it, then check `ls`.

---

### Exercise 2, Verify

**Goal:** Verify the status of your downloaded files (`md5sum` and `md5sum -c`), and see for yourself what a download failure/corrupted file looks like.

**Before you start:** Run `pwd` - confirm you're in `session2`. Run `ls` - confirm you have `sample_1.txt`, `sample_2.txt`, `sample_3.txt`, and `checksums.md5`.

**1.** Calculate the checksum for `sample_1.txt`:
```
md5sum sample_1.txt
```

**2.** Compute checksums for all three sample files in one command:
```
md5sum sample_1.txt sample_2.txt sample_3.txt
```

**3.** Run the batch verification:
```
md5sum -c checksums.md5
```
Do all three files show `OK`?

**4.** Deliberately modify (~corrupt) one file:
```
echo "this line should not be here" >> sample_3.txt
```

**5.** Run the check again:
```
md5sum -c checksums.md5
```
Which file failed? What does the full output say?

**6.** Redownload the corrupted file:
```
wget -O sample_3.txt https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/refs/heads/21-create-wget-branch-to-host-files-for-exercises/wget/files/session2/sample_3.txt
```

**7.** Verify all three files pass again:
```
md5sum -c checksums.md5
```

**You are done when:**
- You have used `md5sum -c` to check the status of the files
- You've seen both `OK` and `FAILED` output from `md5sum -c`
- The check returned `OK` for all three files at step 7

### Exercise 3: Combine and Organize

**Goal:** Combine the three sample files, create an organized directory structure, and move files into it.

**Before you start:** Run `pwd` - confirm you're in `session2`. Run `ls` - confirm `sample_1.txt`, `sample_2.txt`, and `sample_3.txt` are still here.

**Step 1. Combine the three sample files:**
```
cat sample_1.txt sample_2.txt sample_3.txt > combined.txt
```
Verify: `cat combined.txt` - does it contain content from all three files? Is there a specific order?

**Step 2. Create a directory structure:**
```
mkdir organized
mkdir organized/raw
mkdir organized/combined
```
Check: `ls organized/`

**Step 3. Move the original files into `organized/raw/`:**
```
mv sample_1.txt organized/raw/
mv sample_2.txt organized/raw/
mv sample_3.txt organized/raw/
```
Verify:
```
ls organized/raw/
ls
```
The three sample files should now be in `organized/raw` but not in `session2`.

**Step 4. Move the combined file:**
```
mv combined.txt organized/combined/
```

**Step 5. Create a backup copy:**
```
cp organized/combined/combined.txt combined_backup.txt
ls
```

**Step 6. Rename the backup to something descriptive:**
```
mv combined_backup.txt samples_combined.txt
ls
```

**You are done when:**
- `ls organized/raw/` shows `sample_1.txt`, `sample_2.txt`, `sample_3.txt`
- `ls organized/combined/` shows `combined.txt`
- `ls` in `session2` shows `samples_combined.txt`

**Extension - if you finish early:**
- Run `cat organized/raw/sample_1.txt organized/raw/sample_2.txt organized/raw/sample_3.txt` - you can `cat` files using their full paths without entering the directory
- Make a copy of `samples_combined.txt` inside `organized/combined/` - but use a different name
- What happens if you try to `mv` a file to its own name: `mv samples_combined.txt samples_combined.txt`?

---

### Exercise 4: Wildcards

**Goal:** Use wildcards to select groups of files precisely and apply the `ls`-before-acting habit.

**Before you start:** confirm `fruit_a.txt`, `fruit_b.txt`, `fruit_c.txt`, `fruit_info.txt`, `results_final.txt`, and `notes.txt` are already in your `session2/data` folder.

**Step 1. Explore `*`**

**1.** List all `.txt` files: `ls *.txt` - how many files match?

**2.** List only files starting with `fruit_`: `ls fruit_*`

**3.** Now try `ls fruit_*.txt`. What's the difference compared to previous `ls fruit_*`?

**4.** Combine only the files starting with `fruit_` into a single output:
```
cat fruit_*.txt > all_fruit.txt
cat all_fruit.txt
```
What does it contain? Did `fruit_info.txt` get included?

**Step 2. Explore `?`**

**5.** Try `?` to match only a single wildcard character: `ls fruit_?.txt` - which files match? Is `fruit_info.txt` included? Why?

**6.** Compare `fruit_?.txt` vs `fruit_*.txt`:
```
ls fruit_?.txt
ls fruit_*.txt
```
What's the difference in the results?

**Step 3. Preview before acting**

**7.** You want to move only the three `fruit_?.txt` files to an `archive/` folder. Preview first:
```
mkdir archive
ls fruit_?.txt
```
Does the list show exactly what you want to move?

**8.** Only after confirming, move the files:
```
mv fruit_?.txt archive/
```

**9.** Verify the result:
```
ls
ls archive/
```
Are only the three fruit files (`fruit_a.txt`, `fruit_b.txt`, `fruit_c.txt`) in `archive/`?

**10.** Confirm that `fruit_info.txt`, `results_final.txt`, and `notes.txt` are still in `session2`.

**You are done when:**
- `ls archive/` shows `fruit_a.txt`, `fruit_b.txt`, `fruit_c.txt`
- `fruit_info.txt`, `results_final.txt`, and `notes.txt` are still in `session2/data`
- You used `ls` to preview before running `mv`

**Extension - if you finish early:**
- What does `ls ?????.txt` match? Count the `?` characters and explain why.
- Try moving `fruit_info.txt` and `results_final.txt` into a new `misc/` directory using one `mv` command with a wildcard. Preview with `ls` first.
- What would `cat organized/raw/*.txt > organized/combined/combined_v2.txt` do?

---

### Exercise 5: Sort & Unique

**Goal:** Chain commands together, and clean up messy, duplicate-filled data.

**Before you start:** confirm `names.txt` is in your `session2/names` folder - run `ls` after navigating to `session2/names`. Run `cat names.txt` and look at it - notice it's unsorted and has repeated names.

**Step 1. See the raw problem**

**1.** Read the file as-is: `cat names.txt` - how many lines total? How many names look like duplicates?

**Step 2. Sort it**

**2.** Sort the file alphabetically:
```
sort names.txt
```
This does **not** change `names.txt` - it just prints the sorted result to the terminal. Notice the duplicate lines are now next to each other, but still both present.

**Step 3. Pipe into `uniq`**

**3.** `uniq` only removes duplicate lines that are on adjacent lines - which is why we sort first:
```
sort names.txt | uniq
```
Compare this output to plain `cat names.txt`. How many lines dropped?

**4.** Try `uniq` **without** sorting first, and compare:
```
uniq names.txt
```
Why does this leave more duplicates behind than the piped version did?

**Step 4. Count duplicates**

**5.** See how many times each name appears, sorted with counts:
```
sort names.txt | uniq -c
```

**6.** Sort that by count, highest first:
```
sort names.txt | uniq -c | sort -nr
```
This chains three commands together with two pipes - the output of the previous command is piped into the next command as input. Read it left to right: sort the names, collapse duplicates and count them, sort the results by count.

**Step 5. Save the deduplicated result**

**7.** Redirect the deduplicated (and sorted) list into a new file:
```
sort names.txt | uniq > names_clean.txt
cat names_clean.txt
```

**You are done when:**
- You've compared `uniq` and `sort | uniq` outputs and can explain the difference
- `sort names.txt | uniq -c | sort -nr` runs without error and shows the most duplicated line first
- `names_clean.txt` exists and contains no duplicate lines

**Extension - if you finish early:**
- Look closely at `names.txt` - two entries look almost identical but aren't exact duplicates (case, trailing space). Does `sort | uniq` catch them? Why not?
- Try `sort -u names.txt` - how does the output compare to `sort names.txt | uniq`?
- What would `cat names.txt names.txt | sort | uniq` do, and why?

---

## Cheat Sheet

| Command | What it does |
|---|---|
| `wget URL` | Download a file to the current directory |
| `wget -O name URL` | Download and save under a specific filename |
| `md5sum file` | Compute a file's checksum |
| `md5sum -c file.md5` | Verify file(s) against a checksums file |
| `cat f1 f2 > out.txt` | Combine files into a new file |
| `mv old new` | Rename a file (original gone) |
| `mv file dir/` | Move a file into a directory |
| `cp file copy` | Copy a file (original stays) |
| `cp file dir/` | Copy a file into a directory |
| `*` | Wildcard: any number of any characters |
| `?` | Wildcard: exactly one character |
| `sort file` | Sort lines alphabetically |
| `sort file \| uniq` | Remove adjacent duplicate lines|
| `sort -u file` | Shortcut for `sort | uniq` |
| `uniq -c` | Count occurrences of each line |

**Golden rule:** `ls` with your pattern before you `mv` or act on it.

---

## Appendix A - New Commands in Session 2

| Command | What it does | Example |
|---|---|---|
| `wget URL` | Download a file from a URL to current directory | `wget https://example.com/data.txt` |
| `wget -O name URL` | Download and save with a specified filename | `wget -O mydata.txt https://example.com/data.txt` |
| `md5sum file` | Compute the MD5 checksum of a file | `md5sum sample_1.txt` |
| `md5sum file1 file2 file3` | Compute checksums for multiple files | `md5sum sample_1.txt sample_2.txt` |
| `md5sum -c file.md5` | Verify files against a checksums file | `md5sum -c checksums.md5` |
| `cat f1 f2 > out` | Concatenate files into a new output file | `cat a.txt b.txt > combined.txt` |
| `mv old new` | Rename a file | `mv data.txt data_raw.txt` |
| `mv file dir/` | Move a file into a directory | `mv data.txt archive/` |
| `mv file1 file2 dir/` | Move multiple files into a directory | `mv a.txt b.txt archive/` |
| `cp file copy` | Copy a file with a new name | `cp data.txt data_backup.txt` |
| `cp file dir/` | Copy a file into a directory | `cp data.txt backup/` |

**Wildcard reference:**

| Pattern | Matches | Does NOT match |
|---|---|---|
| `*.txt` | Every `.txt` file | files without `.txt` extension. For example, `.csv` files |
| `data_*` | Everything starting with `data_` | Files starting with anything else |
| `data_?.txt` | `data_a.txt`, `data_1.txt` | `data_ab.txt`, `data_10.txt` |
| `data_??.txt` | `data_ab.txt`, `data_10.txt` | `data_a.txt`, `data_abc.txt` |

---

## Appendix B - Session 1 Quick Reference

| Command | What it does |
|---|---|
| `pwd` | Where am I? |
| `ls` / `ls -lh` | What is here? |
| `cd folder` | Enter a directory |
| `cd ..` | Go up one level |
| `cd ~/session2` | Go to session2 from anywhere |
| `mkdir name` | Create a directory |
| `touch file` | Create an empty file |
| `echo "text" > file` | Write to file (overwrites) |
| `echo "text" >> file` | Append to file |
| `cat file` | Read a file |

---

## Appendix C - Troubleshooting Reference

| Error or symptom | Cause | Fix |
|---|---|---|
| `wget: command not found` | wget not installed | Use `curl -O [URL]` as a substitute |
| `404 Not Found` | Wrong or broken URL | Check the URL carefully; copy-paste rather than type |
| Download hung with no progress | Network issue in Codespace | Ctrl+C, then try again; reload browser tab if persistent |
| `md5sum -c` shows `FAILED` for all files | Wrong directory - files listed in checksums.md5 not found here | Run `ls` - confirm sample files and checksums.md5 are in the same directory |
| `md5sum -c` shows `FAILED open or read` | A listed file doesn't exist | The file wasn't downloaded, or is in a different directory |
| `cat file1 file2 > file1` lost content from `file1` | Redirected into a source file | Re-download `file1`; never redirect into a file you're reading from |
| `mv` silently replaced an existing file | Target filename already existed | Re-download or rebuild the overwritten file; check target names before `mv` |
| Wildcard matched too many files | Pattern too broad (e.g. `*` instead of `*.txt`) | Use `ls` first; narrow the pattern |
| Wildcard matched too few files | Pattern too strict, or files not in current directory | `ls` to see what exists; check spelling and location |
| File disappeared after `mv` | Moved to an unexpected location | `ls` in current directory; `ls` in subdirectories; `ls organized/` etc. |
| `No such file or directory` after `cat` with a path | Path is wrong or directory doesn't exist | `ls` step by step along the path to find where it breaks |
