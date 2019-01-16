#!/usr/bin/env bash

source venv/bin/activate

file_config="config/nlu_tensorflow.yml"
name_proyecto=version_docker
name_modelo=nlu
directorio=models/${name_proyecto}/${name_modelo}

if [ -d ${directorio} ];
then
  rm -rd ${directorio}
fi

python -m rasa_nlu.train \
   --config ${file_config} \
   --data data/nlu \
   --path models \
   --fixed_model_name ${name_modelo} \
   --project ${name_proyecto} \
   --verbose

#--url URL     / URL from which to retrieve training data.
#--num_threads NUM_THREADS / Number of threads to use during model training
#--storage STORAGE    / Set the remote location where models are stored. E.g. on AWS. If nothing is configured, the server will only serve the models that are on disk in the configured 'path'.