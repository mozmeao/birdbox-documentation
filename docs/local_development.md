# Local development

This section explains how to get Birdbox running on your machine, so you can maintain and extend it.

## Running directly on your machine

This mode uses sqlite for the DB and stores uploaded media on your machine.

* Install the `just` taskrunner (Docs [here](https://github.com/casey/just); spoiler: `brew install just`)
* Check out the repo
* `cd path/to/birdbox`
* Create then activate a virtual environment (`pyenv` + `pyenv-virtualenv` is recommended, but not required - see [Bedrock docs](https://bedrock.readthedocs.io/en/latest/install.html#local-installation) for installation details). Python 3.11+ is required, which you can install with `pyenv install 3.11.3`

    ``` bash
    pyenv virtualenv 3.11.3 birdbox
    pyenv activate birdbox
    ```

* `just preflight` to install Python and JS dependencies, run migrations (against a simple SQLite DB for local dev) and create a cache table
* To make an admin user `just createsuperuser`. If there are no SSO credentials in your local environment or `.env` file, Birdbox falls back to standard username-plus-password auth.
* To run the local webpack bundler + django runserver: `just run-local` or `npm start` (both do the same thing)
* Go to <http://localhost:8000> for the default Wagtail site, and <http://localhost:8000/admin/> for the CMS UI
* Ideally you would now load in an export from another developer (see tips below), or you can bootstrao your own local site using [the same steps for a live site](../bootstrapping/#wagtail-bootstrap-an-initial-site).

## Running via Docker on your machine

We expect most active development to happen directly on 'bare metal', but it's possible to build and use Docker containers to run Birdbox locally, avoiding the virtualenv and local dependency steps.

!!! note
    Dockerized Birdbox uses a separate Postgres container for its database, not sqlite, so does not (currently) support the exporting and importing of local state.

* Install the `just` taskrunner (Docs [here](https://github.com/casey/just); spoiler: `brew install just`)
* Have Docker desktop and Docker Compose installed
* Check out the repo
* `cd path/to/birdbox`
* Build the needed containers: `docker-compose build assets app`
* Run the app container: `docker-compose up app` then go to <http://localhost:8080> -- note that at the moment you'll start with the default, empty, Wagtail site.

To run commands in the Docker containers, there are a couple of convenience helpers:

* `just docker-preflight` - the same preflighting steps as for local, just run in Docker
* `just docker-shell` - run a bash shell in an _already-running_ Docker container
* `just docker-manage-py SOME_COMMAND` - run Django's `manage.py` script in the already-running docker container, with SOME_COMMAND passed as extra args. e.g.`just docker-manage-py makemigrations`

To that end, if you're setting up a new Docker build locally, you'll want to do the following just to get Wagtail running, but with no imported content.

```
just docker-preflight
just docker-manage-py createsuperuser
just docker-manage-py bootstrap_footer
```

### Using cloud storage with local Docker build

When using Docker locally, it's possible to configure birdbox to use cloud storage, as we do on a deployed/real site.

To do this, copy `./docker/envfiles/local.env.example` as `./docker/envfiles/local.env` and add the relevant env vars for the cloud bucket. The example env file has a link to Django-Storages documentation, which  shows what to set and also links to how to get the Google Cloud Storage (GCS) credentials.

For local use of Docker with GCS, you'll need to put those credentiuals somewhere that the Docker container can reach them - that's what the `local-credentials` directory is for: copy the relevant JSON credentials file into there and update the`GOOGLE_APPLICATION_CREDENTIALS` var in `local.env` file to reference its exact filename.

Once that's done, restart the Docker app and it should Just Work.

## Local development tips

### How To: import and export local data

For local development directly on a machine (not via Docker), we use sqlite as our database, in part because it makes it easier to give another developer a copy of your state, which they can load in to be able to work with the same content you have. This is particularly useful for code review.

(Note that it's not just the database we need to share around: we also need media files that line up with the records in the relevant DB table.)

1. To export a zip file of your local DB and images:

    `just export-local-data`

    ...and note where the zip file is generated. Send that file to a colleague as needed. Note that it is zipped but not password-protected so think about its contents before transmitting.

2. To load in a zip file of DB and image data

    `just import-local-data /path/to/downloaded/file.zip`

    This will **entirely replace** your current sqlite DB file and load in all the images, overwriting existing files if they have the same name. Note that it does not delete image files that aren't in the zip of data.
