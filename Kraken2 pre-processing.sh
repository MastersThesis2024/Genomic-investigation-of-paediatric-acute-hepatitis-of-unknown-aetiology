mamba activate nextflow
results=/path/to/results/directory
human_genome=/path/to/human/reference/genome/Homo_sapiens.GRCh38.dna.primary_assembly.fa
human_index_dir_bowtie=/path/to/bowtie2/index

nextflow run nf-core/taxprofiler -r dev -profile singularity -w ${results}/work --max_cpus 1 --input ${results}/samplesheets/samplesheet.csv --outdir ${results} \
--databases ${results}/databases/database.csv \
--perform_shortread_qc \
--perform_shortread_hostremoval \
--hostremoval_reference ${human_genome} \
--shortread_hostremoval_index ${human_index_dir_bowtie} \
--save_hostremoval_unmapped









