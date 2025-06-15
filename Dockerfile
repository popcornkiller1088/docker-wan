FROM vastai/base-image:cuda-12.8.1-auto

# copy the downloader
COPY fetch_models.sh /usr/local/bin/fetch_models.sh
RUN chmod +x /usr/local/bin/fetch_models.sh

# Install system dependencies
RUN pip install triton && pip install sageattention==1.0.6

# Set working directory
WORKDIR /workspace

# Clone ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git

WORKDIR /workspace/ComfyUI

# Install Python requirements
RUN pip install -r requirements.txt


