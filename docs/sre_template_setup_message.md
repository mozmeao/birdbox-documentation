# Template message for requesting Birdbox-suited infra setup

You should request this work via a JIRA ticket - hit the Create button [here](https://mozilla-hub.atlassian.net/jira/software/c/projects/SE/issues/) and copy-paste-adapt the following message to suit.

----

``` plaintext

Hello!

I would like to request the setup of a new website, using the Birdbox pattern.

The site will be for DEPARTMENT/TEAM/ORG/PROJECT.

The ideal date to have this set up is DATE_HERE. The planned go-live date for
the new site is LAUNCH_DATE_HERE.

## Tenant/Service

We need a new tenant, a mozilla-sre-deploy pipeline and domains set up, please.

The Docker image for the pipeline will come from a fork of `mozmeao/birdbox`
at: https://github.com/ORG_NAME)HERE/REPO_NAME_HERE`

As common for a Birdbox project we will need two k8s jobs set up:

* `db-migrate`` - runs `python birdbox/manage.py migrate` once with every deploy
* `scheduled-publishing`` - runs `python birdbox/manage.py publish_scheduled` every 30 mins

The required backing services are standard for Birdbox-based projects:

* Postgres
* Redis
* Google Cloud Storage
* SMTP mail sending
* A CDN for each dev, stage and prod.
* Performance reporting (Grafana) would also be nice, but doesn't have to
happen straight away.

## Hostnames

The ideal hostname/domain setup will be:

    Dev: dev.PROJECT_NAME.nonprod.webservices.mozgcp.net

    Stage: stage.PROJECT_NAME.nonprod.webservices.mozgcp.net

    Prod, internal/discreet: prod.PROJECT_NAME.prod.webservices.mozgcp.net
    Prod, public-facing: SOME_SUBDOMAIN.mozilla.org or SOME_DOMAIN.TLD

**Please note that the public-facing domain name for Production should NOT be enabled yet, please.**

## Further configuraition

The service will use Mozilla SSO to authenticate CMS users. We will obtain these
credentials from the IAM team and can provision them as secrets ourselves.

When the tenant is set up, please can you let me know the names of the relevant clusters and projects so that I can shell in to the pods running on them, in order to set up the application.

If you have any questions, please don't hesitate to ask.

Many thanks

```
