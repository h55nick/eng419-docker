FROM python:3.12-bookworm

# update system and install pip requirements
RUN apt update
RUN pip install --upgrade pip
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r /tmp/requirements.txt

# forward the jupyter notebooks port
EXPOSE 8888

# Environment variable to prevent Jupyter from opening a browser
ENV JUPYTER_ENABLE_LAB=1
ENV JUPYTER_TOKEN=''


# start the notebook
CMD ["jupyter-notebook", "--ip=0.0.0.0", "--port=8888", "--no-browser", "--allow-root", "--notebook-dir=/mnt/notebooks", "--NotebookApp.token=''", "--NotebookApp.password=''"]
