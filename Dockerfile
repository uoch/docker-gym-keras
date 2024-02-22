FROM python:3.9

# Install required libraries
RUN pip install gym==0.25.2 h5py==3.10.0 keras==2.13.1 keras-rl2==1.0.4 Pillow==10.0.1 tensorflow==2.13.0 numpy==1.23.5

# Install Jupyter Notebook
RUN pip install jupyter

# Set up Jupyter Notebook configuration
RUN mkdir /notebooks
WORKDIR /notebooks

# Install ngrok
RUN wget -qO- https://bin.equinox.io/c/4VmDzA7iaHb/ngrok-stable-linux-amd64.tgz | tar xvz -C /usr/local/bin

# Expose Jupyter Notebook port
EXPOSE 8888

# Add ngrok authtoken as an environment variable
ENV NGROK_AUTHTOKEN=2cjMV5h774y6ZnvXiw57YGEZmvq_MT8LUvQPpRsa3bSLTkPF

# Command to run Jupyter Notebook and ngrok
CMD jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root & ngrok http 8888 -authtoken=$NGROK_AUTHTOKEN