#!/bin/bash

# Define the base directory
BASE_DIR="/mnt/mydisk/data/raw/SRPBS/SRPBS_TS/sourcedata"
SUBJECTS_DIR="/mnt/mydisk/data/processed/freesurfer"

# Set FreeSurfer environment variables
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=1
export OMP_NUM_THREADS=1
export FS_OPENMP_THREADS=1
export SUBJECTS_DIR

# Create SUBJECTS_DIR if it doesn't exist
mkdir -p "$SUBJECTS_DIR"

# Function to process a single subject
process_subject() {
    local subject=$1
    local subject_dir="$BASE_DIR/$subject"
    
    echo "Processing subject: $subject"
    
    # Process only ATV session
    session_dir="$subject_dir/ses-siteATV"
    
    if [ -d "$session_dir" ]; then
        echo "Processing ATV session for subject: $subject"
        
        # Look for T1w image in anat directory
        t1_file=$(find "$session_dir" -name "*T1w.nii.gz" | head -n 1)
        
        if [ -n "$t1_file" ]; then
            echo "T1 file: $t1_file"
            
            # Create subject name for FreeSurfer (subject_ATV)
            fs_subject_name="${subject}_ATV"
            
            # Run recon-all
            recon-all -all -s "$fs_subject_name" -i "$t1_file" -threads 1
        else
            echo "No T1w image found for ATV session in subject: $subject"
        fi
    else
        echo "ATV session not found for subject: $subject"
    fi
}

# Main processing loop
for subject_dir in "$BASE_DIR"/sub-*; do
    if [ -d "$subject_dir" ]; then
        subject=$(basename "$subject_dir")
        process_subject "$subject"
    fi
done 