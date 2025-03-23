# Brain MRI Segmentation Comparison Study

This project focuses on comparing three different brain MRI segmentation methods:
- FreeSurfer (recon-all pipeline)
- SynthSeg
- Brainchop

## Project Overview

The project aims to evaluate and compare the reproducibility of brain segmentation and parcellation results across different methods and datasets:

### Datasets
1. Simon Dataset
2. Traveling Subjects Dataset (SRPBS)

### Analysis Goals
- Compare segmentation reproducibility across methods
- Evaluate parcellation consistency within and between subjects
- Generate comparative visualizations of results
- Assess method-specific strengths and limitations

## Structure

```
brain_mri_segmentation/
├── data/                    # Data directory
│   ├── raw/                # Raw MRI data
│   │   ├── simon/         # Simon dataset
│   │   └── traveling/     # Traveling subjects dataset
│   └── processed/         # Processed and segmented data
│       ├── freesurfer/    # FreeSurfer results
│       ├── synthseg/      # SynthSeg results
│       └── brainchop/     # Brainchop results
├── src/                    # Source code
│   ├── preprocessing/     # Data preprocessing scripts
│   ├── segmentation/      # Segmentation pipeline scripts
│   │   ├── freesurfer/   # FreeSurfer pipeline
│   │   ├── synthseg/     # SynthSeg pipeline
│   │   └── brainchop/    # Brainchop pipeline
│   └── evaluation/       # Evaluation metrics and tools
│       ├── reproducibility/  # Reproducibility analysis
│       └── visualization/    # Result visualization
├── tests/                # Test scripts
└── docs/                # Documentation
```

## Requirements

- FreeSurfer 7.x
- SynthSeg
- Brainchop
- Python 3.8+
- Additional dependencies listed in `requirements.txt`

## Installation

1. Clone the repository:
```bash
git clone https://github.com/your-username/brain-mri-segmentation.git
cd brain-mri-segmentation
```

2. Install dependencies:
```bash
pip install -r requirements.txt
```

## Usage

[Usage instructions will be added as the project develops]

## Expected Outputs

- Reproducibility metrics for each segmentation method
- Comparative visualizations of segmentation results
- Parcellation consistency analysis across subjects
- Statistical analysis of method performance

## License

MIT License

## Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## Authors

Ekaterina Kondrateva, Sandgy Barg