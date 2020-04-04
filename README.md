# Okteto Application Catalog

This Helm repository contains the default Helm charts for the Okteto Cloud default repository:

- [Hello World](hello-world/README.md)
- [MariaDB](mariadb/README.md)
- [MongoDB](mongodb/README.md)
- [Movies](movies/README.md)
- [OpenFaaS](openfaas/README.md)
- [PostgreSQL](postgresql/README.md)
- [RabbitMQ](rabbitmq/README.md)
- [Redis](redis/README.md)
- [WordPress](wordpress/README.md)


# How to submit a new chart

- Fork https://github.com/okteto/charts.
- Add your chart source code in a new folder (Review https://okteto.com/docs/tutorials/repos/index.html to see how to make your chart Okteto Cloud friendly). 
- Test your chart with Okteto Cloud (Feel free to [reach out](https://twitter.com/oktetohq) if you need help).
- Run `make all` to run the linter and package it.
- Submit a PR with the chart.
