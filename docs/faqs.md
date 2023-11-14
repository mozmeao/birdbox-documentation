# FAQs

Handy reminders of how to do certain things with birdbox

## Infrastructure

### How do I redeploy a site?

#### If there are changes (and you want them to go live)

Pushing or merging to a specific git branch will trigger a build and deployment for the relevant service:

| Branch | Service | What triggers it |
| ----- | ----- | ----- |
|`main` | Dev | PRs being merged |
|`stage` | Staging | Push to branch |
|`prod` | Prod | Push to branch |

#### If there are no changes or I just want to restart

1. In the relevant deployment pipeline repository for your site (e.g. `mozilla-sre-deploy/deploy-newsite`) go to `Actions` and select the relevant - e.g. `Deploy Dev`.

2. Look for the `Run Workflow` button and trigger it for `main`[^1].

3. This will start a deployment of a container based on the latest commit for the relevant branch (Dev: `main`, Staging: `stage`, Production: `prod`).

### I've changed config for the site in `webservices-infra`: do I need to redeploy?

Yes.

### I've changed a Secret: do I need to redeploy?

Yes.

Updated Secrets are immediately available in running pods, but you'll need to restart the Django/Wagtail container to get that to notice the new Secrets, and the way to do that is a redeployment.

### How do I sign commits?

In order to merge PRs to `websites-infra`, you'll need signed git commits.

* [This document](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits) gives some context to what a signed commit means in Github.

* [This guide](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key#telling-git-about-your-ssh-key) shows how to sign your commits with an SSH key.

### How do I shell into a running pod

This is [documented internally](https://mozilla-hub.atlassian.net/wiki/spaces/EN/pages/228622344/), but you'll need to know the cluster name(s), project ID and namespace(s) of your pods

### How do I edit Secrets?

The infrastructure-setup stage will configure most of the secrets required for a Birdbox project such as DB, storage and email credentials that cannot to into a git repo.

Birdbox does need at least SSO/OIDC secrets to be set up by a developer. This is done via SRE's [gsm.py](<https://github.com/mozilla-it/gsm-editor>
) helper.

### How to I copy data between dev/stage/prod sites?

Currently, there is no automated way to do this. SRE may need to help you, if you don't already have appropriate access. If you do want to try this yourself, let @stevejalim know and he'll do his best to guide you.

To duplicate site content from, say, Prod to Dev:

1. Get a SQL backup of Prod
2. Download a copy of the media uploaded to the Prod cloud bucket
3. Copy the assets into the Dev stage bucket
4. Load the SQL into the Dev database
5. Redeploy the Dev instance (with no code changes)
6. In the Wagtail admin, go to `Settings > Site` and change the hostname to suit Dev.

## CMS / Site

### How do I do X in Wagtail?

* First stop: <https://guide.wagtail.org/en-latest/>
* Second stop: #wagtail in Mozilla Slack
* Third stop: #birdbox in Mozilla Slack

### How do I add CSS or JS to the project?

The CSS/JS build approach is based heavily on how [Bedrock](https://github.com/mozilla/bedrock) builds its assets (just without the concept of pre-defined bundles).

To add a new CSS or JS file:

* Make a new source file in `src/css/` or `src/js/`
* In `webpack.config.js`, add to the `entry` map in `module.exports`:

    {
        ...
        "name-of-compiled-asset-styles": "./src/css/path/to/asset-source.scss",
        ...
        "name-of-compiled-asset-script": "./src/js/path/to/asset-source.es6",
        ...
    }
* Now, when you're referring to the compiled asset (eg in `frontend_media` on a `StructBlock` or in a `<link>` or `<script>` tag in HTML) refer to the file with a `.js` or `.css` as appropriate:

  * `css/name-of-compiled-asset-styles.css`
  * `js/name-of-compiled-asset-script.js`

### How do I configure the nav for a site?

See [here](../bootstrapping/#enable-footer-and-nav).

### How do I edit the footer for site?

See [here](../bootstrapping/#enable-footer-and-nav).

[^1]: This trigger branch refers to the `main` branch of the pipeline code in `deploy-newsite`, not the `birdbox-newsite` application codebase.
