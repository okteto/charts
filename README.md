# Okteto Cloud Marketplace

This repository contains Helm charts for the Okteto Cloud default repository:

- [Hello World](https://github.com/okteto/charts/tree/master/hello-world)
- [Redis](https://github.com/okteto/charts/tree/master/redis)
- [MongoDB](https://github.com/okteto/charts/tree/master/mongodb)
- [PostgreSQL](https://github.com/okteto/charts/tree/master/postgresql)
- [MariaDB](https://github.com/okteto/charts/tree/master/mariadb)
- [RabbitMQ](https://github.com/okteto/charts/tree/master/rabbitmq)
- [WordPress](https://github.com/okteto/charts/tree/master/wordpress)
- [Movies](https://github.com/okteto/charts/tree/master/movies)


# How to add a new chart

- Add your chart source code
- Run `helm package chart-name` where `chart-name` is the folder of your new chart
- Run `helm repo index --url https://apps.okteto.com/ --merge index.yaml .`
