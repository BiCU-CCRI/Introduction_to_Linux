# Session 3
## Working with Large Files

---

## Overview

Today we'll cover:

1. **Exercise 1: Download and Verify**
2. **Exercise 2: Counting Lines**
3. **Exercise 3: Head & Tail**
4. **Exercise 4: Reading Large Files**
5. **Exercise 5: Searching in files**
6. **Exercise 6: Scripting**
7. **Exercise 7: Variables**
8. **Exercise 8: For Loops**
9. **Exercise 9: Scripts in Scripts**
10. **Exercise 10: Compare similar / identical outputs**
11. Wrap-up

---

## Tasks

### Exercise 1: Download and Verify

**Goal:** Download the input file and confirm its integrity.

**Before you start navigate to session_3** `cd /workspaces/Introduction_to_Linux/session_3/`

**1.** Download `mendel.txt` and `mendel.txt.md5`:
https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/refs/heads/21-create-wget-branch-to-host-files-for-exercises/wget/files/session3/mendel.txt  
https://raw.githubusercontent.com/BiCU-CCRI/Introduction_to_Linux/refs/heads/21-create-wget-branch-to-host-files-for-exercises/wget/files/session3/mendel.txt.md5

**2.** Confirm file integrity by checking the MD5 value (using `md5sum`).

**3.**
- Run `cat mendel.txt`.

---

### Exercise 2: Counting Lines

**Goal:** Get a sense of file size.

**1.** Count the number of lines in `mendel.txt`:
```
wc -l mendel.txt
```

How many lines does the file have?

**You are done when:**
- You can report the line count of `mendel.txt`

**Extension - if you finish early:**
- Run `wc mendel.txt` without `-l`. What extra information do you get?
- How would you check (on the command line) what other parameters are available for `wc`?

---

### Exercise 3: Head & Tail

**Goal:** Preview the beginning and end of a file.

**1.** Look at the start of the file:
```
head mendel.txt
```

**2.** Look at the end of the file:
```
tail mendel.txt
```

**3.** Not enough output? Print more lines:
```
head -n 15 mendel.txt
tail -n 15 mendel.txt
```

**4.** How would you write (save) the output of one of these commands to a new file instead of just printing it to the screen? Try it.

**You are done when:**
- You can check the start and end of `mendel.txt` with a custom number of lines with `head` and `tail`
- You have redirected the output of `head` or `tail` into a new file and confirmed it

### Exercise 4: Reading Large Files

**Goal:** Inspect the contents of a large file using a reader function or editor.

**Part A - Reader (`less`)**

**1.** Open the file in a reader:
```
less mendel.txt
```

* Navigate with arrow keys
* Exit with pressing `q`
* Perform forward searches (`/`) and reverse searches (`?`) -  Press `/`, type a search term (e.g. `hybrid`), then press **Enter/return** to jump to the first match. `n` jumps to next, `N` to previous hit
* `g` jumps to the start of the document, `G` to the end. Note: You can exit the search mode by pressing `Esc` and then `u`
* Exit the file with pressing `q` to quit and return to the command line.

**`less` will never edit or overwrite your files!**

**Part B - Editor (VS Code)**

**2.** Open `mendel.txt` in VS Code: hold `Cmd` (Mac) or `Ctrl` (Windows) and left-click the file from the `ls` output in your terminal, or find it in the VS Code file explorer and click it there.

**3.** Scroll with your mouse. Use `Cmd/Ctrl+F` to search, and `Cmd/Ctrl` + arrow keys to jump around.

**4.** Close the file, then click the **Terminal** panel at the bottom of the window to return to the command line.

**Note: VS Code is _just a text editor_ - like in any other text editor, you *can* accidentally edit or overwrite your files**

**You are done when:**
- You can open, search inside, and close `mendel.txt` using `less`
- You can open the same file in VS Code and search inside it

**Extension - if you finish early:**
- What command would let you check the *last* line of `mendel.txt` without opening `less` or VS Code at all?

---

### Exercise 5: Searching in files

**Goal:** Search inside a file for specific words using `grep`, and build a filtered output file.

**1.** Find every line containing "Hybriden":
```
grep "Hybriden" mendel.txt
```
`grep` prints the entire line where a match is found - since most data is organized in rows, this is very handy.

**2.** `grep` matches case-sensitively by default. Try a case-insensitive search:
```
grep -i "Hybriden" mendel.txt
```

**3.** Prepare a file named `mendel_generation.txt` that contains the first 5 lines of `mendel.txt`, followed by all lines containing the word `Generation`. 

**Extension - if you finish early:**
- Run `grep -v "Generation" mendel.txt`. What does `-v` do?

---

### Exercise 6: Scripting

**Goal:** Turn a sequence of commands into a script.

**1.** Create a new file for your script:
```
touch my_script
```

**2.** Open it in your editor and add these two lines:
```
head -n 5 mendel.txt > mendel_generation.txt
grep "Generation" mendel.txt >> mendel_generation.txt
```
Save your changes.

**3.** Use the `bash` command to run the script. `bash` reads the commands in the script file and executes them:
```
bash my_script
```

This showcases how easy it is to write a script. However, we skipped three **very important best practices** we should follow, since we don't want to produce sloppy code.

**4**. Add a shebang line at the top of the script:
```
#!/bin/bash
```

This tells the operating system which interpreter should be used to run the script when we execute it directly.

**5**. Use a clear filename that immediately shows what type of file it is. For Bash scripts, the `.sh` extension is commonly used:
```
my_script.sh
```

The extension makes the file's purpose easier to recognize.

**6**. Make the script executable:
```
chmod u+x my_script.sh
```

This gives the file permission to be run as a program to you as the owner of the file (user = `u`). After that, you can execute it directly:
```
./my_script.sh
```
`./` means "in this directory." When you run a script, you need to tell Linux where the script is located.

Note that you can use `ls -l` to compare the script's permissions with the other files. Notice that the script now has an additional `x` in the owner's permissions

**7**. The final script should look like this:
```
#!/bin/bash

head -n 5 mendel.txt > mendel_generation.txt
grep "Generation" mendel.txt >> mendel_generation.txt
```

and we can run it either as
```
bash my_script.sh
```
or
```
./my_script.sh
```

**8.** Create a script named `hardcoded.sh` that repeats the command pair above for each of these words: `Hybriden`, `Generation`, `Pflanze`, `Samen`, `Merkmal`. For each word, the script should create a **separate** output file containing the first 5 lines of `mendel.txt` followed by all lines containing the searched word. Note: Code is considered "hardcoded" when values (here, the value is the searched word) are fixed directly in the script's commands, so changing them requires editing the script itself.

Make the script executable and run it.

**You are done when:**
- `my_script.sh` has a shebang line, a `.sh` extension, and runs with `./my_script.sh`
- `hardcoded.sh` produces five separate output files, one per word

---

### Exercise 7: Variables

**Goal:** Replace hardcoded values with a variable so the same script works for any word.

You create a variable by giving it a name and assigning it a value using `=`. Example: `search_word="Hybriden"`. To use the value stored in a variable, add `$` and wrap the variable name in curly brackets. Example: `echo ${search_word}`.  

**1.** Create a file called `variable.sh`.

**2.** Rewrite the repeated logic from `hardcoded.sh` as a single block using a variable:

\`\`\`bash
#!/bin/bash

searched_word="Hybriden"

head -n 5 mendel.txt > mendel_"${searched_word}".txt
grep "${searched_word}" mendel.txt >> mendel_"${searched_word}".txt
\`\`\`

**3.** Rewrite the `hardcoded.sh` script to accept a single command line parameter and save it as a variable:
```
#!/bin/bash

searched_word="$1"

head -n 5 mendel.txt > mendel_"${searched_word}".txt
grep "${searched_word}" mendel.txt >> mendel_"${searched_word}".txt
```
`$1` refers to the first argument passed to the script when you run it.  

Note: You can also write scripts that accept multiple arguments; those would be accessed with `$2`, `$3`, and so on, in the code.

**3.** Make it executable and run it with an argument:
```
chmod u+x variable.sh
bash variable.sh "Generation"
```
`$1` is replaced by `Generation`, so the script searches for the word `Generation` and writes the result to `mendel_Generation.txt`.

**4.** Run it again with a different word, use the up arrow on the command line to recover the last executed command.

**You are done when:**
- `variable.sh` runs successfully with at least two different words as arguments
- Each run produces the expected output file without you editing the script
- You can explain what `$1` in the Bash script refers to

**Extension - if you finish early:**
- What other elements in the script could be replaced by a variable? 
- Try running `variable.sh` with no argument at all. What happens to `${search_word}`?

---

### Exercise 8: For Loops

**Goal:** Use a loop to repeat a command automatically for a list of values, instead of running the script by hand each time.

**1.** A `for` loop repeats the same command block _for_ one or more values consecutively. Look at this example:
```
#!/bin/bash

for search_word in "Hybriden" "Generation" "Pflanze" "Samen" "Merkmal"
do
    echo "Now looking for:"
    echo "${search_word}"
    echo "done"
done
```
The variable `search_word` takes one value at a time - first `Hybriden`, then `Generation`, and so on (left to right). The loop stops itself after the last item.

**2.** Create a script called `forloop.sh` that runs the logic from Exercise 6 once for each of: `Hybriden`, `Generation`, `Pflanze`, `Samen`, `Merkmal`.

**3.** Make it executable and run it. Confirm you get five output files, one per word, without running the script five separate times.

**Extension - if you finish early:**
- Add an `echo "All searches complete."` line after the loop, so we know the search stopped. When does it print, relative to the loop?
- What would happen if you listed the same word twice in the `for` list?

---

### Exercise 9: Scripts in scripts

**Goal:** Call one of your own scripts from inside another script.

**1.** A script can execute another script, just like it can run any other command.

**2.** Update `forloop.sh` so that, instead of running `head` and `grep` directly, it calls `variable.sh` once per word in the loop.

**3.** Run the updated `forloop.sh` and confirm the output files are still produced correctly.

**You are done when:**
- `forloop.sh` no longer contains `head`/`grep` directly - it calls `variable.sh` instead
- Running `forloop.sh` still produces one output file per word

---

### Exercise 10: Compare similar / identical outputs

**Goal:** Confirm that your script still produces the same output after updating your code.

**1.** If you update your code and expect the outputs not to be affected, you can run `diff file_before_the_change.txt file_after_the_change.txt` to identify differences (line by line) between 2 files.

**2.** Run `diff` on `mendel_Hybriden.txt` from `variables.sh` and `mendel_Hybriden.txt` from `forloop.sh`. Think how you go about the identical filename problem.

**3.** Now run `diff` on 2 files where you expect differences. For example the `grep` output for the words`Hybride` and `Hybriden`. How does the output look?

---

## Cheat Sheet

| Command | What it does |
|---|---|
| `wc -l file` | Count the lines in a file |
| `head file` / `head -n N file` | Show the first 10 lines / first N lines |
| `tail file` / `tail -n N file` | Show the last 10 lines / last N lines |
| `less file` | Open a file in a safe, read-only reader (`q` to quit) |
| `grep "Word" file` | Print every line containing `Word` |
| `grep -i "word" file` | Case-insensitive search |
| `grep -c "word" file` | Count matching lines instead of printing them |
| `chmod u+x script.sh` | Make a script executable for the script owner (user) |
| `bash script.sh` / `./script.sh` | Run a script. The first one doesn't require `x` permissions, while the second one does |
| `$1`, `$2`, ... | Arguments passed to a Bash script |
| `for x in a b c; do ...; done` | Repeat a command block for each value |

---

## Appendix A - New Commands in Session 3

| Command | What it does | Example |
|---|---|---|
| `wc -l file` | Count lines in a file | `wc -l mendel.txt` |
| `wc file` | Show line, word, and byte counts | `wc mendel.txt` |
| `head file` | Show the first 10 lines | `head mendel.txt` |
| `head -n N file` | Show the first N lines | `head -n 15 mendel.txt` |
| `tail file` | Show the last 10 lines | `tail mendel.txt` |
| `tail -n N file` | Show the last N lines | `tail -n 15 mendel.txt` |
| `less file` | Open a file in a scrollable, searchable reader | `less mendel.txt` |
| `grep "word" file` | Print all lines containing "word" | `grep "Hybriden" mendel.txt` |
| `grep -i "word" file` | Case-insensitive search | `grep -i "hybriden" mendel.txt` |
| `grep -v "word" file` | Print all  lines NOT containing "word" | `grep -v "Generation" mendel.txt` |
| `chmod u+x file` | Make a file executable for the user | `chmod u+x my_script.sh` |
| `bash script.sh` | Run a script with Bash | `bash my_script.sh` |
| `./script.sh` | Run an executable script | `./my_script.sh` |
| `diff file1 file2` | Check if files are identical, print differences if not | `diff mendel_Hybride.txt mendel_Hybriden.txt` |

**Inside `less`:**

| Key | Action |
|---|---|
| `↑` `↓` / arrow keys | Scroll up and down |
| `/` then `word` | Search forward for "word" |
| `?` then `word` | Search backward for "word" |
| `n` | Jump to next match |
| `N` | Jump to previous match |
| `g` | Jump to the start of the document |
| `G` | Jump to the end of the document |
| `Esc` and then `u` | Stop the search | 
| `q` | Quit `less` |

**Scripting basics:**

| Element | Purpose | Example |
|---|---|---|
| `#!/bin/bash` | Shebang line - tells the OS which interpreter to use | First line of the script |
| `.sh` extension | Signals the file is a shell script | `my_script.sh` |
| `variable="value"` | Assigns a value to a variable | `search_word="Generation"` |
| `${variable}` | Uses the variable's value | `grep "${grep_word}" file` |
| `$1`, `$2`, ... | Positional arguments passed to a Bash script | `bash variables.sh Generation` |
| `for x in a b c; do ...; done` | Loops over a list of values | See Exercise 8 |

---

## Appendix B - Sessions 1 & 2 Quick Reference

| Command | What it does |
|---|---|
| `pwd` | Where am I? |
| `ls` / `ls -lh` | What is here? |
| `cd folder` / `cd ..` | Enter a directory / go up one level |
| `mkdir name` | Create a directory |
| `touch file` | Create an empty file |
| `echo "text" > file` / `echo "text" >> file` | Write to a file (overwrite / append) |
| `cat file` | Read a file |
| `md5sum -c file.md5` | Verify files against a checksums file |
| `mv old new` | Rename or move a file |
| `cp file copy` | Copy a file |
| `*`, `?` | Wildcards - any number of any characters / exactly one |

---

## Appendix C - Troubleshooting Reference

| Error or symptom | Cause | Fix |
|---|---|---|
| Terminal fills with endless output | Ran `cat` on a very large file | `Ctrl+C` to stop, then `clear`; use `head`/`tail`/`less` instead |
| `grep` returns nothing | Word not present, wrong case, or wrong file/directory | Check spelling and case; try `grep -i`; confirm with `ls` and `pwd` |
| Accidentally edited `mendel.txt` in VS Code | Editors can modify files, unlike `less` | Check for unsaved changes; re-download or restore the file if needed |
| `bash: ./my_script.sh: Permission denied` | Script isn't executable yet | Run `chmod +x my_script.sh`, then try again |
| `bash: my_script.sh: command not found` | Ran the script without `bash` or `./` | Use `bash my_script.sh` or `./my_script.sh` |
| Script runs but variable is empty | No argument passed to `$1` | Run the script with an argument, e.g. `bash variables.sh Generation` |

---

## Optional Content

### Built-in Editors: `nano` and `vim`

We won't cover these in detail, but Linux ships with editors you can launch directly from the command line - no additional software like VS Code needed. The most common are `nano` and `vim`.

These are very capable tools, and one of their biggest advantages is that you'll find them on almost any Linux system - making them useful to know even at a basic level. The downside is that they aren't especially intuitive; their power often comes at the cost of readability. There's a reason "How do I exit vim?" is a famous question on the internet.

**`vim` basics:**

- `:` activates **command** mode
  - `:wq` - write and quit (save and exit)
  - `:q` - quit (exit the file)
  - `:q!` - force quit (exit without saving)
  - then press Enter
- `I` activates **insert** mode - you can now edit the file
- `V` activates **visual** mode - select text with arrow keys, copy with `y` (yank), paste with `p`, delete with `d`
- **To exit any mode, press `Esc`**

**`nano` basics:** a simpler, menu-driven editor - the available commands are shown at the bottom of the screen while it's open.

There is a lot more you can do with `vim` and `nano`, but that's outside the scope of this course.

### A More Advanced Variables Script

Once a script works with one variable, it's often worth generalizing further - for example, passing in both the file to search *and* the word to search for:

```
#!/bin/bash

txt_path="$1"
grep_word="$2"
txt_filename="$(basename ${txt_path})"
out_file="${grep_word}"_"${txt_filename}"

head -n 5 "${txt_path}" > "${out_file}"
grep "${grep_word}" "${txt_path}" >> "${out_file}"
```

This version takes the file path as `$1` and the search word as `$2`, so the same script can be reused across different files, not just different words.
