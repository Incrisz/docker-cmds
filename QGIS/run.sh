docker run -d --rm \
  -p 8888:8888 \
  -v jupyterlab-jovyan:/home/jovyan \
  glcr.b-data.ch/jupyterlab/qgis/base


docker run -d --restart always --name Layeredge \
  -p 8888:8888 \
  -v jupyterlab-jovyan:/home/jovyan \
  glcr.b-data.ch/jupyterlab/qgis/base
