# Okteto Application Catalog

This Helm repository contains the default Helm charts for the Okteto Cloud default repository:

- [Hello World](charts/hello-world)
- [MariaDB](charts/mariadb)
- [Movies](charts/movies)
- [MongoDB](charts/mong
- [OpenFaaS](charts/openfaas)
- [PostgreSQL](charts/postgresql)
- [RabbitMQ](charts/rabbitmq)
- [Redis](charts/redis)
- [WordPress](charts/wordpress)


# How to submit a new chart

- Fork https://github.com/okteto/charts.
- Add your chart source code in a new folder (Review https://okteto.com/docs/cloud/repos.html to see how to make your chart Okteto Cloud friendly). 
- Test your chart with Okteto Cloud (Feel free to [reach out](https://twitter.com/oktetohq) if you need help).
- Run `helm package chart-name` where `chart-name` is the folder of your new chart
        
        helm package chart-name -d chart-name
- Commit the chart code and the generated tgz.
- Submit a PR with the chart.
