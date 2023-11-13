# Extending functionality

This section assumes you know your way around Wagtail - if not, please at least review [Wagtail's Getting Started guide](https://docs.wagtail.org/en/stable/getting_started/index.html)) so that you understand how Wagtail fits into a Django project.

Ideally: DOWNSTREAM FLOW

If you plan to bring something back upstream:

## How To: Add a new StreamField component based on a Protocol component

1. Define a new block in Python in `microsite/blocks.py` with the fields/content items that the Protocol component needs (eg title, description, image)
2. Add a new HTML template fragment for the new block in `microsite/templates/blocks/`
    * Base the markup on the HTML in the Protocol docs' examples
    * Remember to circle back and reference the template in the Python block definition
3. If JS or CSS is needed for the component, configure webpack to build it - see `src/css/protocol/card.scss` as an example
    * Remember to circle back to the Python nlock definition to set the `frontend_media` property so that this CSS/JS gets included when needed
4. Find the page (in `microsite.models`) with a StreamField that you want the new component to be available in. Add it to the list of blocks that are available.
5. `make makemigrations` then `make migrate` to get the DB up to speed
6. In the Wagtail CMS admin, amend an instance of the relevant page to use your new block - you should be able to see it in the live preview. Usually it takes a bit of tweaking to get the page to look as you intend.
7. If you need to add custom CSS to override what's in Protocol, add to `src/css/birdbox-protocol-overrides.css`
