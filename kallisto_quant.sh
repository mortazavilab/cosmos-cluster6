#!/bin/bash
#SBATCH --job-name=align    ## Name of the job
#SBATCH -A SEYEDAM_LAB            ## account to charge 
#SBATCH -p standard               ## partition/queue name
#SBATCH --nodes=1                 ## (-N) number of nodes to use
#SBATCH --cpus-per-task=8         ## number of cores the job needs
#SBATCH --output=align-%J.out ## output log file
#SBATCH --error=align-%J.err ## error log file
#SBATCH --mem=64G

# Load kallisto software
module load kallisto

# Directory containing fastq files
fastq_dir="/data/class/cosmos2023/PUBLIC/fastq"

# Kallisto index file
index_file="/data/class/cosmos2023/PUBLIC/ref/homo_sapiens/transcriptome.idx"

# Directory containing the output folders
mkdir ../output
output_dir="../output"

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
    
    # Path to the abundance.tsv file
    abundance_file="${output_folder}/abundance.tsv"
    
    # Run collapse_transcripts.py script
    python collapse_transcripts.py "${abundance_file}"
    
    # Rename the gene_abundance.tsv file to include the folder name
    mv gene_abundance.tsv "${output_folder}/gene_abundance.tsv"
done
