#!/bin/bash

# Base directories
export BASE_DIR="/mnt/mydisk"
export SRPBS_DIR="${BASE_DIR}/SRPBS_TS/sourcedata"
export FREESURFER_DIR="${BASE_DIR}/freesurfer"
export FREESURFER_LOG_DIR="${FREESURFER_DIR}/logs"

# Create necessary directories
mkdir -p "$FREESURFER_DIR"
mkdir -p "$FREESURFER_LOG_DIR" 