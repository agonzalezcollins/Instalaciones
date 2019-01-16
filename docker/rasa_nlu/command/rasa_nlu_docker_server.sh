#!/usr/bin/env bash

export http_proxy=''
export https_proxy=''

source venv/bin/activate

fuser -k 5000/tcp

dir_path=$1

if [ -z "$dir_path" ]
then
  dir_path=models
fi


python -m rasa_nlu.server \
   --path ${dir_path} \
   --response_log logs/ \
   --cors '*' \
   --port 5000 \
   --token securitycode \
   --config config/nlu_tensorflow.yml \
   --verbose
   #--endpoints config/endpoints.yml \
   #--emulate dialogflow \
   #--pre_load version_01 version_02 \
   #--max_training_processes \
   #--num_threads \
   #--wait_time_between_pulls 3 \
   #--write log_nlu \
   #--storage \

####################################
# -e --emulate {wit,luis,dialogflow}
# -P PORT, --port PORT
# --pre_load PRE_LOAD [PRE_LOAD ...]  # Preload models into memory before starting the server. If given `all` as input all the models will be loaded. Else you can specify a list of specific project names. Eg: python -m rasa_nlu.server -p project1 project2
# -t TOKEN, --token TOKEN
# -w WRITE, --write WRITE        # file where logs will be saved
# --cors [CORS [CORS ...]]       # List of domain patterns from where CORS (cross-origin resource sharing) calls are allowed. The default value is `[]` which forbids all CORS requests.
# --max_training_processes MAX_TRAINING_PROCESSES       # Number of processes used to handle training requests. Increasing this value will have a great impact on memory usage. It is recommended to keep the default value.
# --num_threads NUM_THREADS      # Number of parallel threads to use for handling parse requests.
# --endpoints ENDPOINTS           # Configuration file for the model server as a yaml file
# --wait_time_between_pulls WAIT_TIME_BETWEEN_PULLS   # Wait time in seconds between NLU model serverqueries.
# --response_log RESPONSE_LOG    # Directory where logs will be saved (containing queries and responses).If set to ``null`` logging will be disabled.
# --storage STORAGE              # Set the remote location where models are stored. E.g. on AWS. If nothing is configured, the server will only serve the models that are on disk in the configured `path`.
# -c CONFIG, --config CONFIG     # Default model configuration file used for training.
####################################

# DOC: https://rasa.com/docs/nlu/0.13.8/config/#server-parameters