#!/bin/bash

# get allocation with salloc -p hackathon2 --nodes=1 --ntasks-per-node=2 --mem=4G --time=0-1 --gres=gpu:2 /bin/bash
# then run this as needed to test

# get most recent version
cp ../build/bin/EcoSLIM .

# run exe
./EcoSLIM

passing=true
# check outputs
for f in accepted/* ; do
    if [[ $f == *Load_info* ]]; then
        # just compare first part, tail has timing info
        cmp <(head ${f##*/}) <(head $f) || { echo $f differs ; passing=false ;}
    elif [[ $f == *fort.12 ]]; then
        # only compare first column
        cmp \
            <(sed 's/ \+/\t/g;s/\t//' fort.12 | cut -f 1) \
            <(sed 's/ \+/\t/g;s/\t//' accepted/fort.12 | cut -f 1) \
            || { echo $f differs ; passing=false ;}
    else
        cmp ${f##*/} $f || { echo $f differs ; passing=false ;}
    fi
done

# remove files if all are passing
if [ $passing = true ]; then
    rm Device*
    rm Load*
    rm fort.12
    rm SLIM*
    rm Particle*
    rm Log*
    rm Exited*
    echo PASSED!
fi
