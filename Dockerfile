FROM vastai/base-image:cuda-12.8.1-auto

# copy the downloader
COPY fetch_models.sh /usr/local/bin/fetch_models.sh
RUN chmod +x /usr/local/bin/fetch_models.sh

# # Install system dependencies
# RUN pip install triton && pip install sageattention==1.0.6

# Set working directory
WORKDIR /workspace

# Clone ComfyUI
RUN git clone https://github.com/comfyanonymous/ComfyUI.git

# install ComfyUI dependencies
WORKDIR /workspace/ComfyUI

# Install the requirements for the WanVideoWrapper
RUN pip install -r requirements.txt

# install WanVideoWrapper dependencies
RUN git clone https://github.com/Comfy-Org/ComfyUI-Manager /workspace/ComfyUI/custom_nodes/ComfyUI-Manager

WORKDIR /workspace/ComfyUI/custom_nodes/ComfyUI-Manager

RUN pip install -r requirements.txt

# install WanVideoWrapper dependencies
RUN git clone https://github.com/kijai/ComfyUI-WanVideoWrapper /workspace/ComfyUI/custom_nodes/ComfyUI-WanVideoWrapper

WORKDIR /workspace/ComfyUI/custom_nodes/ComfyUI-WanVideoWrapper

RUN pip install -r requirements.txt

# install rgthree-comfy dependencies
RUN git clone https://github.com/rgthree/rgthree-comfy /workspace/ComfyUI/custom_nodes/rgthree-comfy


# install easy use dependencies
RUN git clone https://github.com/yolain/ComfyUI-Easy-Use /workspace/ComfyUI/custom_nodes/ComfyUI-Easy-Use

WORKDIR /workspace/ComfyUI/custom_nodes/ComfyUI-Easy-Use

RUN pip install -r requirements.txt

RUN bash install.sh

# install ComfyUI-VideoHelperSuite dependencies
RUN git clone https://github.com/yolain/ComfyUI-VideoHelperSuite /workspace/ComfyUI/custom_nodes/ComfyUI-VideoHelperSuite

WORKDIR /workspace/ComfyUI/custom_nodes/ComfyUI-VideoHelperSuite

RUN pip install -r requirements.txt





# Install Python requirements
# RUN pip install -r requirements.txt


