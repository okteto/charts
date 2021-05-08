# Okteto Application Catalog

This Helm repository contains the default Helm charts for the Okteto Cloud default repository:

- [CockroachDB](cockroachdb/README.md)
- [Drupal](drupal/README.md)
- [Flux](flux/README.md)
- [GitLab CI Runner](gitlab-runner/README.md)
- [Hello World](hello-world/README.md)
- [Litmus Chaos](litmuschaos/README.md)
- [Inlets](inlets/README.md)
- [MariaDB](mariadb/README.md)
- [MongoDB](mongodb/README.md)
- [OpenFaaS](openfaas/README.md)
- [PostgreSQL](postgresql/README.md)
- [Prometheus](prometheus/README.md)
- [RabbitMQ](rabbitmq/README.md)
- [Redis](redis/README.md)
- [Stacks](stacks/README.md)
- [Tensorflow-Notebook](tensorflow-notebook/README.md)
- [Terminal](terminal/README.md)

# Contributor Guide

We welcome contributions! Are we missing your favorite Cloud Native App? Want to upgrade an existing one?

The main process is:

- File an issue with your idea, in case someone else on the community is already working on it (or ping us via slack).
- Fork https://github.com/okteto/charts.
- Add your chart source code in a new folder (Review https://okteto.com/docs/tutorials/repos/index.html to see how to make your chart Okteto Cloud friendly).
- If adding a new chart, include an icon for your chart as $YOUR_CHART/icon.png
- Submit a PR with the chart.

> For more details, you can visit https://okteto.com/blog/get-started-with-the-okteto-cloud-application-catalog/

To test the chart:

- Login to Okteto from your terminal:  `okteto login`
- Export the name of the namespace you'll deploy into (typically your GitHub ID): `export NAMESPACE=rberrelleza`
- Push your changes to Okteto Cloud: `okteto push --deploy`
- Add your catalog to your Okteto Cloud account in https://cloud.okteto.com/#/settings/repositories
- Deploy your app (the apps from the default catalog will have an `okteto` label).

Okteto Cloud is a multitenant platform. Because of this, charts deployed via Okteto have certain restrictions. [Check out this document](https://okteto.com/docs/cloud/multitenancy) to learn more about it.

Feel free to reach out to us in the #okteto channel in the [Kubernetes Slack](https://slack.k8s.io/) or [Twitter](https://twitter.com/oktetohq) if you get stuck.
