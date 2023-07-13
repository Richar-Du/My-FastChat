OMP_NUM_THREADS=20 CUDA_VISIBLE_DEVICES=4,5 torchrun --nproc_per_node=2 --master_port=20000 fastchat/train/train_mem.py \
    --model_name_or_path /media/public/models/huggingface/long_llama_3b  \
    --data_path ../FastChat/data/data.json \
    --bf16 True \
    --output_dir /output \
    --num_train_epochs 3 \
    --per_device_train_batch_size 32 \
    --per_device_eval_batch_size 2 \
    --gradient_accumulation_steps 1 \
    --evaluation_strategy "no" \
    --save_strategy "steps" \
    --save_steps 300 \
    --save_total_limit 10 \
    --learning_rate 2e-5 \
    --weight_decay 0. \
    --warmup_ratio 0.03 \
    --lr_scheduler_type "cosine" \
    --logging_steps 1 \
    --fsdp "full_shard auto_wrap" \
    --fsdp_transformer_layer_cls_to_wrap 'LlamaDecoderLayer' \
    --tf32 True \
    --model_max_length 256000 \
    --gradient_checkpointing True \
    --lazy_preprocess True