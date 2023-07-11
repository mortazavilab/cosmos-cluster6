#!/bin/bash
#SBATCH --job-name=align    ## Name of the job
#SBATCH -A cosmos2023_lab            ## account to charge 
#SBATCH -p standard               ## partition/queue name
#SBATCH --nodes=1                 ## (-N) number of nodes to use
#SBATCH --cpus-per-task=2         ## number of cores the job needs
#SBATCH --output=align-%J.out ## output log file
#SBATCH --error=align-%J.err ## error log file
#SBATCH --mem=16G

# Load kallisto program
module load kallisto

# Directory containing fastq files
fastq_dir="/data/class/cosmos2023/PUBLIC/fastq"

# Kallisto index file
index_file="/data/class/cosmos2023/PUBLIC/ref/homo_sapiens/transcriptome.idx"

# Make directory containing the output folders
mkdir ../kallisto_output
output_dir="../kallisto_output"

# Loop through each pair of fastq files
for fastq_1 in "${fastq_dir}"/*_1.fastq.gz; do
    fastq_2="${fastq_1/_1.fastq.gz/_2.fastq.gz}"
    
    # Extract the file name without extension
    filename=$(basename "$fastq_1")
    sample_name="${filename%_1.fastq.gz}"
        
    # Create output folder based on the sample name
    output_folder="${output_dir}/${sample_name}"
    
    # Run kallisto quant command
    kallisto quant -i "${index_file}" -o "${output_folder}" "${fastq_1}" "${fastq_2}"
    
    # Path to the original kallisto output
    abundance_file="${output_folder}/abundance.tsv"
    
    # Run collapse_transcripts.py script to collapse transcripts to genes
    python collapse_transcripts.py "${abundance_file}"
    
    # Rename the gene_abundance.tsv file to include the folder name (save it in the sample folder)
    mv gene_abundance.tsv "${output_folder}/gene_abundance.tsv"
done
