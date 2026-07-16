# Introduction to Linux and the Command Line

A course for CCRI users on how to use Linux and the command line.

## The Linux operating system - the OS of choice for high performance and scientific computing

While most personal computers and laptops run Windows or macOS, Linux is the predominant operating system for high-performance computing (HPC) systems, including servers and computing clusters. In fact, Linux runs on all of the world's top 500 fastest supercomputers [^1]

[^1]: Wikipedia contributors. "TOP500." *Wikipedia, The Free Encyclopedia*. Accessed 16 July 2026. https://en.wikipedia.org/wiki/TOP500

![Operating systems used on the TOP500 supercomputers](https://upload.wikimedia.org/wikipedia/commons/thumb/0/0d/Operating_systems_used_on_top_500_supercomputers.svg/500px-Operating_systems_used_on_top_500_supercomputers.svg.png)

<sup>*Operating systems used on the TOP500 supercomputers by Benedikt.Seidl - Eigenes Werk (own work) / source top500.org, Public Domain, https://commons.wikimedia.org/w/index.php?curid=5932978*</sup>

Another important reason Linux is the OS of choice for scientific computing is that it is open source - anyone can inspect, modify, and improve its source code. This means there are no licensing fees, and the system can be customised to suit a wide range of hardware and research applications. As a result, most scientific computing infrastructure runs Linux, and many bioinformatics tools are developed primarily for Linux environments.

---

## The graphical user interface (GUI) and command line interface (CLI) - and why we use the CLI

Each of us interacts with a computer every day. It is easy to overlook that this involves first logging in with a user account, then giving the computer different tasks to perform. There are two main ways to interact with an operating system: a **graphical user interface (GUI)** or a **command line interface (CLI)**.

<img width="3799" height="1159" alt="gui_vs_cli" src="https://github.com/user-attachments/assets/fa09bae2-5e13-4f97-ab23-b31a39e642d9" />

<sup>*GUI vs CLI*</sup>

A GUI allows users to interact with the computer by clicking icons, buttons, and menus, whereas a CLI involves typing text-based instructions. A command is simply an instruction you give the computer to perform a task. Like a sentence in a language, commands have a specific structure, or syntax, that tells the computer exactly what to do and how to do it.

### Benefits of the CLI

**Automation:**
- File navigation and editing can often be easier through a GUI, especially for small numbers of files. However, the CLI is much more powerful when tasks need to be repeated or automated.
- Imagine you've just come back from a holiday and your camera created files like `IMG_0001.jpg`, `IMG_0002.jpg`, `IMG_0003.jpg`, ... and you want them to become `Italy_001.jpg`, `Italy_002.jpg`, `Italy_003.jpg`, ... In a GUI, you might need a special renaming tool or manually rename each file. With the CLI, a single command can rename hundreds of files automatically.

**Remote access:**
- CLIs typically consume far less network bandwidth than GUIs, making them much better suited to remote computing environments.
- Most servers and computing clusters do not run a GUI because graphical interfaces consume additional system resources and are unnecessary for typical workloads. Instead, users usually interact with these systems remotely through the command line.

**Documentation and troubleshooting:**
- Because the CLI is text-based, the exact commands you run can be easily recorded, shared, and repeated.
- The CLI also provides output and error messages that can be saved in log files, making troubleshooting and reproducing analyses much easier.

---

By the end of this course, you'll be able to combine a sequence of simple commands into a script. Similarly, in bioinformatics, individual tools can be chained together to create workflows or pipelines that process large datasets. You don't need to be a programmer to use Linux — many scientists accomplish analyses using just a handful of basic commands.

---

## How to get started with this introductory course

### Opening GitHub Codespaces

This course is designed to run in [GitHub Codespaces](https://github.com/features/codespaces), so you do not need to install any software on your own computer.

1. Scroll back to the top of this GitHub page.
2. Click the green **Code** button.
3. Select the **Codespaces** tab.
4. Click **Create codespace on main**.
5. Wait for the environment to build - this can take a minute or two the first time.

<!-- TODO: Add screenshot of "Create codespace on main" when repository is close to finished -->

Once it is ready, you will have a complete Linux environment running in your browser, including a terminal where you can run commands.
<!-- TODO: Add screenshot of where Terminal is when repository is close to finished -->

You can experiment freely in this environment — if something goes wrong, you can always restart the Codespace or return to the original course files.

> [!NOTE]
> GitHub Codespaces is free for individual users within the included monthly usage allowance (currently up to 60 hours per month). This should be sufficient to complete this introductory course.

> [!TIP]
> **When you have finished the course:** Remember to delete your Codespace if you no longer need it. Codespaces that are left unused can continue to count towards your storage and usage limits. You can always create a new Codespace from this repository again in the future if needed.

### Following the sessions

The course is divided into sessions, each contained in its own folder (`session_1`, `session_2`, and so on). Each folder contains a `sessionN_instructions.md` file with:

- An overview of what the session covers
- Step-by-step exercises to complete in order
- A cheat sheet and full command reference for the session
- A troubleshooting appendix covering common errors

Work through the sessions in order, as later sessions build on commands and concepts introduced earlier. Within each session, follow the exercises from top to bottom.

---

## How to quickly look up information

You won't remember every command or option, and that's fine - knowing how to look things up quickly is itself a core Linux skill.

**Use built-in documentation:**
- `command --help` prints a short summary of what a command does and its available options, e.g. `ls --help`.
- `man command` opens the full manual page for a command, e.g. `man grep`. Use the arrow keys or spacebar to scroll, and press `q` to quit.

**Check the session material:**
- Each session's cheat sheet and Appendix A cover the commands introduced so far.
- Appendix C in each session lists common errors and how to fix them - check there first if something isn't working as expected.

**Search online:**
- Include "linux" or "bash" in your search terms (e.g. "linux rename multiple files") to avoid Windows- or macOS-specific results.
- Prefer official documentation (`man` pages, GNU coreutils manual) over random blog posts when you need to be sure about behaviour.
- If you get an error message, search for it close to verbatim - error messages are usually specific enough that someone else has hit the same one before.

**Ask an AI tool:**
- Tools like ChatGPT or Claude are good at explaining what a command or error message means, or suggesting the right command for a task you can describe in plain English.
- Always check and understand a suggested command before running it - especially anything involving `rm`, `mv`, or file permissions, since these can't be undone.

---

Let's get started!
