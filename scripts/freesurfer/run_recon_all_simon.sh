#!/bin/bash

# Set FreeSurfer environment variables
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=1
export OMP_NUM_THREADS=1
export FS_OPENMP_THREADS=1

# Set FreeSurfer environment
export FREESURFER_HOME=/usr/local/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

# Set output directory
export SUBJECTS_DIR=/mnt/mydisk/freesurfer

# Create output directory if it doesn't exist
mkdir -p $SUBJECTS_DIR

# Set base directory for SIMON data
SIMON_BASE="/mnt/mydisk/data/raw/SIMON/SIMON_TS/sourcedata"

# Process each subject
for subject_dir in "$SIMON_BASE"/sub-*; do
    if [ -d "$subject_dir" ]; then
        subject=$(basename "$subject_dir")
        
        # Process each session
        for session_dir in "$subject_dir"/ses-*; do
            if [ -d "$session_dir" ]; then
                session=$(basename "$session_dir")
                subject_session="${subject}_${session}"
                
                # Find T1w image
                t1w_file=$(find "$session_dir" -name "*T1w.nii.gz" -type f | head -n 1)
                
                if [ -n "$t1w_file" ]; then
                    echo "Processing $subject_session"
                    echo "Input file: $t1w_file"
                    
                    # Run recon-all
                    recon-all -i "$t1w_file" \
                            -subjid "$subject_session" \
                            -all \
                            -parallel \
                            -openmp 1
                else
                    echo "No T1w image found for $subject_session"
                fi
            fi
        done
    fi
done 