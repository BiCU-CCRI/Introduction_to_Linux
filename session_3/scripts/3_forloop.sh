txt_path=$1
txt_filename=$(basename ${txt_path})



for grep_word in "Hybriden" "Generation" "Samen" "Merkmal" "Pflanzen"
do
out_file=${grep_word}_${txt_filename}
head -n 5 ${txt_path} > ${out_file}
grep ${grep_word} ${txt_path} >> ${out_file}
done
