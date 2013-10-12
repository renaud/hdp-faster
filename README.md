Hierarchical Dirichlet Process (with Split-Merge Operations)
============================================================

(C) Copyright 2010, Chong Wang and David Blei
written by Chong Wang, chongw@cs.princeton.edu.

---

This is a C++ implementation of hierarchical Dirichlet process for topic modeling. 

The split-merge algorithm is preliminary.

Note that this code requires the Gnu Scientific Library, http://www.gnu.org/software/gsl/

---


TABLE OF CONTENTS


A. COMPILING

B. POSTERIOR INFERENCE

C. INFERENCE ON NEW DATA

D. PARAMETER SETTINGS

E. PRINTING TOPICS

---------------------------------------


#### A. COMPILING

Type "make" in a shell. Make sure the GSL is installed. You may need to change
the Makefile a bit.


#### B. TRANING (POSTERIOR INFERENCE)

The following shows an example of performing posterior inference on a set of documents

    hdp --train_data data --directory my_model_dir 


Data format:

`--data` points to a file where each line is of the form (the LDA-C format):

    [M] [term_1]:[count] [term_2]:[count] ...  [term_N]:[count]

where `[M]` is the number of unique terms in the document, and the
`[count]` associated with each term is how many times that term appeared
in the document. 

The sampler will produce some files in the `--directory`,

- *-topics.dat: the word counts for each topic, with each line as a topic
- *.bin: the binary model file used for inference on new data.
- state.log: various information to monitor the Markov chain.
- *-word-assignments.dat: print each word's assignment to the topic and the table, which is in R-friendly format `d w z t`

    d: document id
    w: word id
    z: topic index
    t: table index (only for document level. If you only analyze the topics, this is irrelevant.)

More parameter settings, run `hdp --help`


#### C. INFERENCE ON NEW DATA

To perform inference on a different set of data (in the same format as before), run:

    hdp --test_data  data --directory my_model_dir 

where `--directory` is the saving directory from training.

The sampler will produce some files in the `--directory`,

- `test-*-topics.dat`: the word counts for each topic, with each line as a topic
- `test*-word-assignments.dat`: print each word's assignment to the topic and the table, which is in R-friendly format.
- `test.log`: various information to monitor the Markov chain.
- `test-*.bin`: the binary model file used for inference on newer data.

More parameter settings, run `hdp --help`



#### D. PARAMETER SETTINGS

The meaning of the parameters is the same as in the in the following paper

`Y. Teh, M. Jordan, M. Beal, and D. Blei. Hierarchical Dirichlet processes.
Journal of the American Statistical Association, 2006. 101[476]:1566-1581`


#### E. PRINTING TOPICS

A R script (`print.topics.R`) is included to print topics. Make sure it is
executable. (`chmod +x print.topics.R`) For example,

    print.topics.R mode-topics.dat vocab.dat topics.dat 10

will produce a topic list with top 10 words selected. For help, run `print.topics.R`


--- 

# My Notes:

#### INSTALL (OS X)

    brew install gsl
    make

#### TRAIN

    cd hdp-faster
    ./hdp --help

    mkdir train_dir
    ./hdp --train_data /Volumes/HDD2/ren_data/dev_hdd/bluebrain/9_lda/_preproc/20130617_pubmed_preproc/dca/dca.txtbag.noheader --directory train_dir

#### GSL on viz-cluster

    cd ~/public/lib/
    wget ftp://ftp.gnu.org/gnu/gsl/gsl-1.7.tar.gz
    tar -zxvf gsl-1.7.tar.gz
    rm gsl-1.7.tar.gz
    cd gsl-1.7

    ./configure --prefix=/home/richarde/public/lib
    make
    make install

Now in hdp-faster's Makefile:

    GSL_INCLUDE = /home/richarde/public/include
    GSL_LIB = /home/richarde/public/lib

Then

    make linux linux-d



