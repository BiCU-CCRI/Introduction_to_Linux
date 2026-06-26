#!/bin/bash

# Hybriden
head -n 5 data/txt/mendel.txt > hybriden_mendel.txt
grep Hybriden data/txt/mendel.txt >> hybriden_mendel.txt

# Pflanzen
head -n 5 data/txt/mendel.txt > pflanzen_mendel.txt
grep Pflanzen data/txt/mendel.txt >> pflanzen_mendel.txt

# Samen
head -n 5 data/txt/mendel.txt > samen_mendel.txt
grep Samen data/txt/mendel.txt >> samen_mendel.txt

# Merkmal
head -n 5 data/txt/mendel.txt > merkmal_mendel.txt
grep Merkmal data/txt/mendel.txt >> merkmal_mendel.txt

# Generation
head -n 5 data/txt/mendel.txt > generation_mendel.txt
grep Generation data/txt/mendel.txt >> generation_mendel.txt
