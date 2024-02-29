#!/bin/bash

# Script to reproduce results

# Declare an associative array
declare -A envs

# Initialize the array with keys and values, splitting over multiple lines
envs=(
    ["halfcheetah-random-v2"]=0.95
    ["hopper-random-v2"]=0.6
    ["walker2d-random-v2"]=0.8
    ["halfcheetah-medium-v2"]=0.95
    ["hopper-medium-v2"]=0.7
    ["walker2d-medium-v2"]=0.9
    ["halfcheetah-medium-replay-v2"]=0.95
    ["hopper-medium-replay-v2"]=0.9
    ["walker2d-medium-replay-v2"]=0.9
    ["halfcheetah-medium-expert-v2"]=0.7
    ["hopper-medium-expert-v2"]=0.5
    ["walker2d-medium-expert-v2"]=0.8
    ["halfcheetah-expert-v2"]=0.5
    ["hopper-expert-v2"]=0.5
    ["walker2d-expert-v2"]=0.3
)

# Iterate over the associative array and print keys and values
for env in "${!envs[@]}"; do
    for ((seed=0;seed<10;seed+=1))
	do
        lam=${envs[$env]}
        python examples/train_d4rl.py \
        --algo_name=MCQ \
        --task d4rl-$env \
		--seed $seed \
        --lam $lam \
        --log-dir=logs/$env-mcq-lam$lam/$i
    done
done
