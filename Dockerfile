FROM python:3.9

# Install required libraries
RUN pip install gym==0.25.2 h5py==3.10.0 keras==2.13.1 keras-rl2==1.0.4 Pillow==10.0.1 tensorflow==2.13.0 numpy==1.23.5

# Install Jupyter Notebook
RUN pip install jupyter

# Set up Jupyter Notebook configuration
RUN mkdir /notebooks
WORKDIR /notebooks

# Expose Jupyter Notebook port
EXPOSE 80

# Command to run Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=80", "--no-browser", "--allow-root"]
