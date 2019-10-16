# Okteto Application Catalog

This Helm repository contains the default Helm charts for the Okteto Cloud default repository:

- [Hello World](https://github.com/okteto/charts/tree/master/hello-world)
- [Redis](https://github.com/okteto/charts/tree/master/redis)
- [MongoDB](https://github.com/okteto/charts/tree/master/mongodb)
- [PostgreSQL](https://github.com/okteto/charts/tree/master/postgresql)
- [MariaDB](https://github.com/okteto/charts/tree/master/mariadb)
- [RabbitMQ](https://github.com/okteto/charts/tree/master/rabbitmq)
- [WordPress](https://github.com/okteto/charts/tree/master/wordpress)
- [Movies](https://github.com/okteto/charts/tree/master/movies)


# How to submit a new chart

- Fork https://github.com/okteto/charts.
- Add your chart source code in a new folder (Review https://okteto.com/docs/cloud/repos.html to see how to make your chart Okteto Cloud friendly). 
- Test your chart with Okteto Cloud (Feel free to [reach out](https://twitter.com/oktetohq) if you need help).
- Run `helm package chart-name` where `chart-name` is the folder of your new chart
        
        helm package chart-name -d chart-name
- Commit the chart code and the generated tgz.
- Submit a PR with the chart.
