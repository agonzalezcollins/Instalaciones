#!/usr/bin/env bash

source venv/bin/activate

name_proyecto=version_docker
name_modelo=dialogue
directorio=models/${name_modelo}/${name_proyecto}

if [ -d ${directorio} ];
then
  rm -rd ${directorio}
fi

python -m rasa_core.train \
    -d data/domain.yml \
    -s data/core/stories.md \
    -o ${directorio} \
    --epochs 300

#--url URL / If supplied, downloads a story file from a URL and trains on it. Fetches the data by sending a GET request to the supplied URL.
#--nlu NLU  / trained nlu model
#--history HISTORY /  max history to use of a story
#--validation_split VALIDATION_SPLIT / Percentage of training samples used for validation, 0.1 by default
#--batch_size BATCH_SIZE / number of training samples to put into one training batch
#--online / enable online training
#--augmentation AUGMENTATION / how much data augmentation to use during training
#--debug_plots  / If enabled, will create plots showing checkpoints and their connections between story blocks in a file called `story_blocks_connections.pdf`.
#--dump_stories  / If enabled, save flattened stories to a file
#--endpoints ENDPOINTS  / Configuration file for the connectors as a yml file
#--nlu_threshold NLU_THRESHOLD  / If NLU prediction confidence is below threshold, fallback will get triggered. 
#--core_threshold CORE_THRESHOLD  / If Core action prediction confidence is below the threshold a fallback action will get triggered
#--fallback_action_name FALLBACK_ACTION_NAME  / When a fallback is triggered (e.g. because the ML prediction is of low confidence) this is the name of tje action that will get triggered instead.
#--verbose  / Be verbose. Sets logging level to INFO
#--quiet  / Be quiet! Sets logging level to WARNING  