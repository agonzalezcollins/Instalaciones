#!/usr/bin/env bash

source venv/bin/activate

comando="import rasa_nlu as nlu; print('RASA NLU: ' + nlu.__version__);
import tensorflow as tf; print('TensorFlow: ' + tf.__version__);
import sklearn; print('Scikit-learn: {}.'.format(sklearn.__version__));
import spacy; print('spaCy: ' + spacy.__version__)"

#try:
#        print(sys.version)
#    except ImportError as error:
#        print(error.__class__.__name__ + ": " + error.message)

python -c "${comando}"