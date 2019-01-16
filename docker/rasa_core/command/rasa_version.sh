#!/usr/bin/env bash

source venv/bin/activate

comando="import rasa_nlu as nlu; print('RASA NLU: ' + nlu.__version__);
import rasa_core as core; print('RASA CORE: ' + core.__version__);
import rasa_core_sdk.version as sdk; print('RASA CORE SDK: ' + sdk.__version__);
import tensorflow as tf; print('TensorFlow: ' + tf.__version__);
import keras; print('Keras: ' + keras.__version__);
import sklearn; print('Scikit-learn: {}.'.format(sklearn.__version__));
import spacy; print('spaCy: ' + spacy.__version__)"

python -c "${comando}"