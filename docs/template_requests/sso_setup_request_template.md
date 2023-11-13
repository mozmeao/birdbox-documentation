```
Hello!

We are working on a microsite for <TEAM/ORG> which is due to go live on <DATE>.

It's a project build on the [Birdbox](https://github.com/mozmeao/birdbox) kit and needs SSO setting up to allow access to the content management system

For _each_ of the sites/domains listed below, I would be extremely grateful if you can please provision the following:

1. OIDC credentials for each site as mentioned in [this documentation](https://mozilla-django-oidc.readthedocs.io/en/stable/installation.html#acquire-a-client-id-and-client-secret).

2. A specific group created in people.m.o for each site to allow SSO access (group names and curators will be listed below)

3. The relevant IAM-side mapping so that only members of that specific people.m.o group can sign in to a site using the OIDC credentials above

Setup spec:

(The OIDC callback path for all of the below will be `/oidc/callback/`)

1. NEWSITE Production

* Domain(s): https://NEWSITE.mozilla.com, https://prod.NEWSITE.CLUSTER.SUBDOMAIN.DOMAIN.TLD

* people.m.o group name: `birdbox-NEWSITE-production`

* Initial curators: YOUR_HANDLE@mozilla.com, APPROPRIATE_PERSON@mozilla.com

2. NEWSITE Staging

* Domain(s): https://stage.NEWSITE.CLUSTER.SUBDOMAIN.DOMAIN.TLD

* people.m.o group name: `birdbox-NEWSITE-staging`

* Initial curators: YOURHANDLE@mozilla.com, OTHERDEVELOPER1@mozilla.com

3. NEWSITE Development

* Domain(s): https://dev.NEWSITE.CLUSTER.SUBDOMAIN.DOMAIN.TLD, http://localhost:8000, http://locahost:8080, http://127.0.0.1:8000, http://127.0.0.1:8080

* people.m.o group name: `birdbox-NEWSITE-development`
d
* Initial curators: YOURHANDLE@mozilla.com, OTHERDEVELOPER1@mozilla.com


Credentials can be sent to be via whatever secure mechanism the IAM team prefers. I will ensure they are set for the services that need them.

Any questions, just ask in comments on this ticket, in #birdbox, or via DM.

Thank you!
```
