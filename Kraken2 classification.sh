mamba activate nextflow
results=/path/to/results/directory

nextflow run nf-core/taxprofiler -r dev -profile singularity -w ${results}/work --max_cpus 1 \
--input ${results}/samplesheets/samplesheet_filtered.csv \
--databases ${results}/databases/database.csv \
--outdir ${results} \
--run_kraken2 --kraken2_save_readclassifications \