#!/bin/bash

export model=$1
export num_gpus=8
export worker_port=30000
CUDA_VISIBLE_DEVICES=0,1,2,3,4,5,6,7 python -m fastchat.serve.vllm_worker --model-path $model --num-gpus $num_gpus --port $worker_port --worker-address http://localhost:$worker_port &
worker_port=$((worker_port+1))
