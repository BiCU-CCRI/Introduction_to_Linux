# Session 1
## Introduction to Linux: Navigating the Terminal

---

## Overview

Today we'll cover:

1. Setup & first commands
2. **Exercise 1: First Commands**
3. Filesystem & navigation
4. **Exercise 2: Navigation**
5. *Break*
6. Creating files & directories
7. **Exercise 3: Build a Project Structure**
8. Writing data to files
9. **Exercise 4: Writing & Reading Files**
10. Wrap-up

---

## Important Notes

A few things worth keeping in mind all session:

- **Linux is case-sensitive.** `whoami` and `Whoami` are different commands.
- **Read your error messages.** They almost always tell you exactly what went wrong - that's not a failure, it's the terminal helping you.
- **`clear` only clears the screen**, it deletes nothing. Scroll up and everything is still there.
- **Never use spaces in filenames.** `touch my notes.txt` creates *two* files (`my` and `notes.txt`), not one. Use underscores instead.
- **`Ctrl+C` is always safe.** If the prompt shows `>` instead of `$`, you likely have an unclosed quote - `Ctrl+C` cancels and returns you to the prompt.
- **`rm` has no undo.** Deleting a file is permanent, with no confirmation and no trash bin.
- **`>` overwrites silently; `>>` appends.** `>` replaces a file's entire content with no warning. Use `>` once to start a file, then `>>` for every line after.
- **`pwd` is your reset button.** Whenever you're unsure where you are, run `pwd`. Whenever you're lost, `cd /codespaces/session1` gets you home.
- **Use Tab completion constantly.** It prevents typos and helps you explore.

---

## Tasks

### Exercise 1: First Commands

**Goal:** Run your first commands, read the output, and learn what happens when something goes wrong.

**1.** Run `whoami`. What is the output?

**2.** Run `ls`. What do you see? These are the files and folders at your current location.

**3.** Run `clear`. What happened to the screen? Scroll up - is your previous output still there?

**4.** Deliberately make an error - type this exactly, including the capital letter:
```
Whoami
```
Read the error message. What does it tell you?

**5.** Try another deliberate typo:
```
ks
```
Read the error. How is it the same as the error above, and how is it different?

**6.** Use the **up arrow** on your keyboard. What happens? Press it again. Try pressing the **down arrow**. What does the arrow key pair do?

**7.** Run `whoami` successfully one more time to finish clean.

**You are done when:**
- You have run `whoami`, `ls`, and `clear` successfully
- You have produced two error messages and can explain in one sentence what caused each one
- You know what the up arrow does

**Extension - if you finish early:**
- Run `ls` twice in a row without changing anything. Is the output identical? What does that tell you?
- Find a third command to type that produces a `command not found` error
- Run `clear`. Now scroll up. What do you see?

---

### Exercise 2: Navigation

**Goal:** Move through the filesystem independently. Always know where you are.

**Before you start:** Run `pwd` to confirm you're in `session1`.

**Part A - Create and enter a folder**

**1.** Create a new directory: `mkdir navigation_test`

**2.** Confirm it was created: `ls` - you should see `navigation_test` in the list.

**3.** Move into it: `cd navigation_test`

**4.** Where are you now? `pwd` - what does the path show? How did it change?

**5.** List the contents: `ls` - what do you see? Is that expected for a brand-new empty directory?

**Part B - Move back up**

**6.** Go back up one level: `cd ..`

**7.** Confirm where you are: `pwd`

**8.** Is `navigation_test` still there? `ls`

**9.** List the *contents* of `navigation_test` without entering it: `ls navigation_test` - what's inside it?

**Part C - Go deeper**

**10.** Enter `navigation_test` again.

**11.** Inside it, create a folder called `sub_folder`: `mkdir sub_folder`

**12.** Enter `sub_folder`.

**13.** Run `pwd`. What is the full path now?

**14.** Use `cd ..` to go up one level. Run `pwd`. Where are you?

**15.** Use `cd ..` again to return to `session1`. Run `pwd` to confirm.

**16.** Use `rm -r` to delete `navigation_test`.

**You are done when:**
- You can navigate into and out of folders without referring to the cheat sheet
- `pwd` reliably tells you where you are at any moment
- You understand why an empty directory shows nothing when you run `ls`
- You can delete folders and understand that `rm -r` deletes the specified folder and all its contents. The command does not ask for confirmation!

**Extension - if you finish early:**
- Run `pwd` to check the current directory and copy the path.
- Try `cd ~`. Where does it take you? Run `pwd` to check.
- From your home directory, use `cd` (with **Tab completion**) or paste the path you copied earlier to return to `session1`.

---

*Break*

---

### Exercise 3: Build a Project Structure

**Goal:** Build a directory hierarchy and navigate it confidently.

**Before you start:** Run `pwd` to confirm you're in `session1`. Run `ls` to see what's already there.

**Your goal is to create this structure inside `session1`:**

```
projects/
├── work/
│   └── tasks.txt
└── personal/
    └── ideas.txt
```

**Step 1 - Create the top-level directory:**
```
mkdir projects
```
Confirm it exists with `ls`.

**Step 2 - Create the two subdirectories:**
```
mkdir projects/work
mkdir projects/personal
```
You can do this from `session1` - you don't need to `cd` into `projects` first.

**Step 3 - Create the files:**
```
touch projects/work/tasks.txt
touch projects/personal/ideas.txt
```

**Step 4 - Verify the structure:**

Navigate into `projects` and list with details:
```
cd projects
ls -l
```
You should see `work` and `personal`.

Run `tree` to display the directory structure of `projects`.

Enter `work` and confirm:
```
cd work
ls -l
```
You should see `tasks.txt`.

**Step 5 - Return to `session1`:**

From inside `work`, how many `cd ..` commands do you need to get back to `session1`? Try it. Or use `cd /codespaces/session1`.

**Step 6 - Verify from the top:**

Back in `session1`, run `ls -l projects/work` - you should see `tasks.txt` without navigating into the folder.

**You are done when:**
- The directory structure above exists with both `.txt` files in place
- You can confirm the structure with `ls -l` from inside the folders
- You can return to `session1` from anywhere

**Extension - if you finish early:**
- Add a third subdirectory inside `projects` called `archive`
- Create a file inside `archive` called `old_notes.txt` without navigating into `archive` - do it with a path, from `session1`
- Run `ls -l projects/` from `session1` to verify all three subdirectories
- Try using **Tab completion** for every single `cd` and `mkdir` command
- Try `mkdir -p some_folder/nested_folder` - this creates both levels in a single command.

---

### Exercise 4: Writing & Reading Files

**Goal:** Use `echo`, `>`, `>>`, and `cat` to write content to files and read it back.

**Before you start:** Run `pwd` to confirm you're in `session1`. Run `ls` to see what's already there.

**Part A - Create and write**

**1.** Create an empty file: `touch file1.txt`

**2.** Write a word into a new file: `echo "hello" > file2.txt`

**3.** Append a second word to the same file: `echo "world" >> file2.txt`

**4.** Read `file2.txt`: `cat file2.txt` - did both lines appear?

**5.** Now read `file1.txt`: `cat file1.txt` - what's inside it? Is that what you expected?

**Part B - Understand the difference between `>` and `>>`**

**6.** Write a new line to `file2.txt` using `>`: `echo "overwrite test" > file2.txt`

**7.** Read `file2.txt` again: `cat file2.txt` - what happened to "hello" and "world"?

**8.** Now build a file correctly using `>>` - a list of fruits:
```
echo "apple" > fruits.txt
echo "banana" >> fruits.txt
echo "cherry" >> fruits.txt
```

**9.** Read it back: `cat fruits.txt` - you should see all three lines.

**Part C - Your own file**

**10.** Create a file called `notes.txt`.

**11.** Write at least **three lines** of any text into it using `echo`. Use `>` for the first line and `>>` for all subsequent lines.

**12.** Read the whole file back with `cat`.

**You are done when:**
- You can explain in one sentence the difference between `>` and `>>`
- `cat fruits.txt` shows three lines
- `cat notes.txt` shows at least three lines of your own content

**Extension - if you finish early:**
- Run `cat file1.txt fruits.txt` - what does this do? What's the output?
- Now run `cat file1.txt fruits.txt > combined.txt`, then `cat combined.txt`. What happened?
- What would happen if you ran `echo "grape" > fruits.txt` right now? Try it, then check with `cat`.

---

## Cheat Sheet

| Command | What it does |
|---|---|
| `whoami` | Print current username |
| `pwd` | Print working directory |
| `ls` / `ls -l` / `ls -lh` | List files (plain / detailed / human-readable sizes) |
| `ls -t` / `ls -r` | Sort by time / reverse order |
| `cd`, `cd ..`, `cd ~` | Change directory, go up one level, go home |
| `mkdir`, `mkdir -p` | Create a directory / create nested directories at once |
| `touch` | Create an empty file |
| `rm` | Delete a file - **no undo** |
| `echo "text"` | Print text |
| `cat` | Display file contents |
| `clear` | Clear the screen (doesn't delete anything) |
| `>` / `>>` | Redirect output to a file - overwrite / append |

**Keyboard shortcuts:** `Tab` autocompletes · `Tab Tab` shows all matches · `↑` `↓` move through command history · `Ctrl+C` cancels the current command

---

## Appendix A - Full Command Reference for Session 1

| Command | What it does | Example |
|---|---|---|
| `whoami` | Print current username | `whoami` |
| `pwd` | Print working directory | `pwd` |
| `ls` | List files and directories | `ls` |
| `ls -l` | Long format listing | `ls -l` |
| `ls -lh` | Long format with human-readable sizes | `ls -lh` |
| `ls -t` | Sort by modification time, newest first | `ls -t` |
| `ls -r` | Reverse the sort order | `ls -r` |
| `ls --help` | Show all available options | `ls --help` |
| `cd` | Change directory | `cd session1` |
| `cd ..` | Go up one level | `cd ..` |
| `cd ~` | Go to home directory | `cd ~` |
| `cd ~/session1` | Go directly to session1 from anywhere | `cd ~/session1` |
| `mkdir` | Create a directory | `mkdir my_folder` |
| `mkdir -p` | Create nested directories in one command | `mkdir -p a/b/c` |
| `touch` | Create an empty file | `touch file.txt` |
| `rm` | Delete a file (no undo) | `rm file.txt` |
| `echo` | Print text | `echo "hello"` |
| `cat` | Read and display file contents | `cat file.txt` |
| `clear` | Clear the terminal screen | `clear` |
| `>` | Redirect output to a file (overwrites) | `echo "hi" > file.txt` |
| `>>` | Redirect output to a file (appends) | `echo "hi" >> file.txt` |

---

## Appendix B - Keyboard Shortcuts

| Key | Action |
|---|---|
| `Tab` | Autocomplete file or directory name |
| `Tab Tab` | Show all matches when there are multiple |
| `↑` | Go back one step in command history |
| `↓` | Go forward one step in command history |
| `Ctrl+C` | Cancel current command; return to prompt |

---

## Appendix C - Troubleshooting Reference

| Error or symptom | Cause | Fix |
|---|---|---|
| `command not found` | Typo or wrong case | Check spelling exactly; Linux is case-sensitive |
| Terminal shows `>` instead of `$` | Unclosed quote or bracket | Press `Ctrl+C` |
| `cd: no such file or directory` | Typo, or the directory doesn't exist where you think | Run `ls` and check the exact spelling and location |
| `mkdir: cannot create directory: File exists` | The folder already exists | Not an error - run `ls` to confirm, then `cd` into it |
| `mkdir: no such file or directory` | Trying to create a nested folder before its parent exists | Create the parent first, or use `mkdir -p` |
| Two unexpected files created | Space in filename (`touch my file.txt`) | Use underscores: `touch my_file.txt` |
| File content gone after writing | Used `>` instead of `>>` | Rebuild the file; use `>>` to append |
| File gone entirely | Used `rm` on the wrong file | No undo - recreate it; double-check filenames with `ls` before `rm` |
| "Nothing happens" when I type | Command not followed by Enter | Press Enter; check the cursor is in the terminal pane |
| Codespace feels slow or unresponsive | Common with first-time use | Wait 30 seconds; if still stuck, reload the browser tab |
