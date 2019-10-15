# Okteto Cloud Marketplace

This repository contains Helm charts for the Okteto Cloud default repository:

- [Hello World](https://github.com/okteto/charts/hello-world)
- [WordPress](https://github.com/okteto/charts/wordpress)
- [Redis](https://github.com/okteto/charts/redis)
- [MongoDB](https://github.com/okteto/charts/mongodb)
- [PostgreSQL](https://github.com/okteto/charts/postgresql)
- [MariaDB](https://github.com/okteto/charts/mariadb)
- [RabbitMQ](https://github.com/okteto/charts/rabbitmq)
- [Movies](https://github.com/okteto/charts/movies)


# How to add a new chart

- Add your chart source code
- Run `helm package chart-name` where `chart-name` is the folder of your new chart
- Run `helm repo index --url https://apps.okteto.com/ --merge index.yaml .`
