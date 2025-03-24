#!/bin/bash

# Set FreeSurfer environment variables
export ITK_GLOBAL_DEFAULT_NUMBER_OF_THREADS=1
export OMP_NUM_THREADS=1
export FS_OPENMP_THREADS=1

# Set the output directory for FreeSurfer
export SUBJECTS_DIR="/mnt/mydisk/freesurfer"
mkdir -p "$SUBJECTS_DIR"

# Base path to SRPBS data
SRPBS_BASE="/mnt/mydisk/data/raw/SRPBS/SRPBS_TS/sourcedata"

# Loop over all subjects
for subject_dir in "$SRPBS_BASE"/sub-*; do
    [ -d "$subject_dir" ] || continue
    subject=$(basename "$subject_dir")
    echo "📂 Processing subject: $subject"

    # Loop over all sessions
    for session_dir in "$subject_dir"/ses-*; do
        [ -d "$session_dir" ] || continue
        session=$(basename "$session_dir")

        # Skip ATT sessions
        if [[ $session == ses-siteATT* ]]; then
            echo "⏭️ Skipping session: $session"
            continue
        fi

        # Compose paths
        t1w_file="$session_dir/anat/${subject}_${session}_T1w.nii.gz"
        subject_session="${subject}_${session}"

        if [ -f "$t1w_file" ]; then
            echo "🧠 Processing: $subject_session"
            
            # Check if subject already exists to avoid re-run errors
            if [ -d "$SUBJECTS_DIR/$subject_session" ]; then
                echo "⚠️  Subject $subject_session already processed. Skipping..."
                continue
            fi

            # Run FreeSurfer
            recon-all \
              -s "$subject_session" \
              -i "$t1w_file" \
              -all \
              -threads 1 \
              -sd "$SUBJECTS_DIR"

        else
            echo "❌ Missing T1w image: $t1w_file"
        fi
    done
done
