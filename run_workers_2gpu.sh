#!/bin/bash

export model=$1
export num_gpus=2
export worker_port=30000
CUDA_VISIBLE_DEVICES=0,1 python -m fastchat.serve.vllm_worker --model-path $model --num-gpus $num_gpus --port $worker_port --worker-address http://localhost:$worker_port &
worker_port=$((worker_port+1))
CUDA_VISIBLE_DEVICES=2,3 python -m fastchat.serve.vllm_worker --model-path $model --num-gpus $num_gpus --port $worker_port --worker-address http://localhost:$worker_port &
worker_port=$((worker_port+1))
CUDA_VISIBLE_DEVICES=4,5 python -m fastchat.serve.vllm_worker --model-path $model --num-gpus $num_gpus --port $worker_port --worker-address http://localhost:$worker_port &
worker_port=$((worker_port+1))
CUDA_VISIBLE_DEVICES=6,7 python -m fastchat.serve.vllm_worker --model-path $model --num-gpus $num_gpus --port $worker_port --worker-address http://localhost:$worker_port &
worker_port=$((worker_port+1))
