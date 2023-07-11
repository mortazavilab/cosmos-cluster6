import sys

# Read abundance.tsv and store est_counts and tpm values in a dictionary
abundance_dict = {}

with open(sys.argv[1], 'r') as abundance_file:
    next(abundance_file)  # Skip the header line
    for line in abundance_file:
        fields = line.strip().split('\t')
        target_id = fields[0]
        est_counts = float(fields[3])
        tpm = float(fields[4])
        abundance_dict[target_id] = (est_counts, tpm)

# Sum est_counts, tpm values, and store gene names based on IDs in transcripts_to_genes.txt
gene_abundance = {}
with open('/data/class/cosmos2023/PUBLIC/ref/homo_sapiens/transcripts_to_genes.txt', 'r') as transcripts_file:
    for line in transcripts_file:
        fields = line.strip().split('\t')
        transcript_id = fields[0]
        gene_id = fields[1]
        gene_name = fields[2]
        if gene_id not in gene_abundance:
            gene_abundance[gene_id] = [0.0, 0.0, gene_name]  # Initialize with [est_counts_sum, tpm_sum, gene_name]
        if transcript_id in abundance_dict:
            est_counts, tpm = abundance_dict[transcript_id]
            gene_abundance[gene_id][0] += est_counts
            gene_abundance[gene_id][1] += tpm

# Write gene_abundance.tsv file with column names
with open('gene_abundance.tsv', 'w') as output_file:
    output_file.write("gene_id\tgene_name\test_counts\ttpm\n")  # Write column names
    for gene_id, values in gene_abundance.items():
        est_counts_sum, tpm_sum, gene_name = values
        output_file.write(f"{gene_id}\t{gene_name}\t{est_counts_sum}\t{tpm_sum}\n")

