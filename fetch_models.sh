#!/usr/bin/env bash
# fetch_models.sh – grab WanVideo checkpoints & ComfyUI-Manager

set -euo pipefail

# Where your ComfyUI repo lives inside the container / VM
CU_ROOT="/workspace/ComfyUI"

# -----------------------------------------------------------------------------
# helper: download if file missing or zero-bytes
grab () {
    local url="$1" dest="$2"
    mkdir -p "$(dirname "$dest")"

    if [[ -s "$dest" ]]; then
        echo "✓ $(basename "$dest") already exists – skipping"
    else
        echo "↓ Downloading $(basename "$dest")..."
        curl -L --fail --progress-bar -o "$dest" "$url"
    fi
}

# -----------------------------------------------------------------------------
# VAE
grab \
  "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1_VAE_bf16.safetensors" \
  "$CU_ROOT/models/vae/Wan2_1_VAE_bf16.safetensors"

# Diffusion
grab \
  "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan2_1-I2V-14B-480P_fp8_e4m3fn.safetensors" \
  "$CU_ROOT/models/diffusion_models/Wan2_1-I2V-14B-480P_fp8_e4m3fn.safetensors"

# Text encoder
grab \
  "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/umt5-xxl-enc-fp8_e4m3fn.safetensors" \
  "$CU_ROOT/models/text_encoders/umt5-xxl-enc-fp8_e4m3fn.safetensors"

# LoRA
grab \
  "https://huggingface.co/Kijai/WanVideo_comfy/resolve/main/Wan21_CausVid_14B_T2V_lora_rank32.safetensors" \
  "$CU_ROOT/models/loras/Wan21_CausVid_14B_T2V_lora_rank32.safetensors"

# CLIP-Vision
grab \
  "https://huggingface.co/Comfy-Org/Wan_2.1_ComfyUI_repackaged/resolve/main/split_files/clip_vision/clip_vision_h.safetensors" \
  "$CU_ROOT/models/clip_vision/clip_vision_h.safetensors"

echo "All done! 🥳"
