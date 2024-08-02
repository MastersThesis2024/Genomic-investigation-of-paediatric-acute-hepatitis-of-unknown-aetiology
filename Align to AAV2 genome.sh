#Align with bowtie2
 mamba activate bowtie2
 (bowtie2 -x /path/to/indexed/AAV2/genome/files \
        --very-sensitive \
        -1 /path/to/first/input/FASTQ/file/containing/unmapped/reads/*.unmapped_1.fastq.gz \
        -2 /path/to/second/input/FASTQ/file/containing/unmapped/reads/*.unmapped_2.fastq.gz \
        -S /path/to/output/SAM/file/*_bowtie2alignAAV2.sam) \
        2> /path/to/log/file/*_log.txt

# Extract mapped reads
mamba activate samtools
samtools view -bF 4 -h /path/to/previous/step/SAM/file/*_bowtie2alignAAV2.sam |
samtools sort - \
> /path/to/output/BAM/file/*_bowtie2alignAAV2.bam

# Remove duplicates
mamba activate samtools
samtools collate -@ 4 -O -u /path/to/previous/step/BAM/file/*_bowtie2alignAAV2.bam |
samtools fixmate -@ 4 -m -u - - |
samtools sort -@ 4 -u - |
samtools markdup -@ 4 -r -d 2500 - /path/to/output/BAM/file/with/duplicates/removed/*_bowtie2alignAAV2_dedup.bam \
-f /path/to/output/stats/file/*_bowtie2alignAAV2_dedup_stats.txt

# Index
mamba activate samtools
samtools index /path/to/previous/step/BAM/file/with/duplicates/removed/*_bowtie2alignAAV2_dedup.bam

# Make depth file
mamba activate samtools
samtools depth /path/to/BAM/file/with/duplicates/removed/*_bowtie2alignAAV2_dedup.bam \
> /path/to/output/depth/file/*_depth.txt

