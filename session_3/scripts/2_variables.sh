#!/bin/bash

txt_path=$1
grep_word=$2
txt_filename=$(basename ${txt_path})
out_file=${grep_word}_${txt_filename}

head -n 5 ${txt_path} > ${out_file}
grep ${grep_word} ${txt_path} >> ${out_file}
