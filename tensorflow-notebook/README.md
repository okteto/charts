# TensorFlow Notebook Helm Chart

TensorFlow is an open source software library for numerical computation using data flow graphs, and tensorboard is the tool visualizing TensorFlow programs. Using Jupyter notebook to get into TensorFlow and develop models is the great way for data scientist. With these three tools you are able to start your machine learning work in two minutes.

-  https://www.tensorflow.org
-  https://www.tensorflow.org/programmers_guide/summaries_and_tensorboard
-  http://jupyter.org/

## Prerequisites

- Kubernetes cluster v1.8+

## Chart Details

This chart will deploy the following:

- Jupyter Notebook with TensorFlow
- Tensorboard

## Configuration

The following table lists the configurable parameters of the Service Tensorflow Development
chart and their default values.

| Parameter | Description | Default | Optional |
|-----------|-------------|---------|----------|
| `jupyter.image.repository` | TensorFlow Development image repository | `tensorflow/tensorflow` | No |
| `jupyter.image.tag` | TensorFlow Development image tag | `1.5.0-devel-gpu` | No |
| `jupyter.password` | The password to access jupyter | `okteto` | No |
| `jupyter.image.pullPolicy` | image pullPolicy for the  jupyter | `IfNotPresent` | No |
| `jupyter.persistence.accessMode` | Volume access mode |  `ReadWriteOnce` | Yes (Required if persitence is enabled) |
| `jupyter.persistence.enabled` | Data persistence | `true` | No |
| `jupyter.persitence.size` | Volume size | `1Gb` | Yes (Required if persitence is enabled) |
| `resources` | Set the resource to be allocated and allowed for the Pods | `{}` | Yes |
| `service.type` | service type | `ClusterIP` | No |
| `tensorboard.image.repository` | TensorFlow Development image repository | `tensorflow/tensorflow` | No |
| `tensorboard.image.tag` | TensorFlow Development image tag | `1.5.0-devel-gpu` | No |
| `tensorboard.image.pullPolicy` | image pullPolicy for the  tensorboard | `IfNotPresent` |No |
