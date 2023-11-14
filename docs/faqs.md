# FAQs

Handy reminders of how to do certain things with birdbox

## Infrastructure

### How do I redeploy a site?

* if there are changes
* if there are not changes

### I've changed config in webservices-infra: do I need to redeploy?

TODO

### I've changed a Secret: do I need to redeploy?

TODO

### How do I sign commits?

I need to sign my commits to be able to contribute to the `webservices-infra` repo. What? (LINK BACK TO THIS FROM THE BOOTSTRAPPING DOCS)

### How do I shell into a running pod

TODO

### How do I edit Secrets?

The infrastructure-setup stage will configure most of the secrets required for a Birdbox project such as DB, storage and email credentials that cannot to into a git repo.

Birdbox does need at least SSO/OIDC secrets to be set up by a developer. This is done via SRE's [gsm.py](<https://github.com/mozilla-it/gsm-editor>
) helper.

For very specific instructions on how to use it, please see the internal MEAO runbook. TODO: add this.

TODO
TODO
TODO

### How to I copy data between dev/stage/prod sites?

TODO

## CMS / Site

### How do I do X in Wagtail?

<https://guide.wagtail.org/en-latest/>

### How do I add CSS or JS to the project?

TODO

### How do I configure the nav for a site?

TODO

### How do I edit the footer fora site?

TODO
