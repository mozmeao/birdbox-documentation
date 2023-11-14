# Birdbox

Birdbox is a kit for building on-brand, easily editable microsites quickly.

It was developed by the Marketing Engineering team to save us time and to put more control over content in the hands of the relevant project’s teams.

Birdbox aims to be a full-stack solution. It brings together three key aspects:

* A class-leading content management system: Wagtail

* Mozila’s design system for the web, [Protocol](https://protocol.mozilla.org), to help ensure the sites look and behave like Mozilla sites

* Streamlined infrastructure setup.

This is a documentation-only repo. The codebase for the kit is at <https://github.com/mozmeao/birdbox/>

----

## Project philosophy

The repository at <https://github.com/mozmeao/birdbox/> is a "turn-key" Wagtail CMS project for Mozilla.

This means it's pre-configured with appropriate Wagtail `Page` and `Block` types that use Protocol-based HTML, CSS and JS. This ensures that pages created are automatically on-brand and up-to-standard for Mozilla.

Birdbox has also been through Mozilla's Rapid Risk Assessment process, so the security of sites running on Birdbox with it is up to our standards and will be kept high.
<!-- To come: link to the HTTP Observatory score for a birdbox-on-birdbox demo site -->

!!! note "Key concepts"

    1. You don't _need_ to do any development to the codebase to be able to deploy a working CMS-backed website. (You can still add new things, however. Check out [Extending Birdbox](extending.md).)

    2. Every Birdbox site runs the same code as the [core repository](https://github.com/mozmeao/birdbox/) but that core repo is never directly deployed[^1] - it must be forked before use. We explore this model more in [Maintenance](maintenance.md).

    3. We have clear documentation about how to connect the new site's (forked) repo to Mozilla SRE's build and deployment pipeline. After that, they deployment process is simple: if you can `git push origin:main|stage|prod`, you can deploy changes.

    4. It should be possible to go from nothing to a live site in a week - or less if no custom work development is needed.

----

## Documentation Roadmap

* [x] Move from simple Markdown to GH pages
* [x] end-to-end setup process of a new site
* [x] Document infra side, with code samples
* [ ] Turn all of the above into a tickable checklist, to speed up the process
* [ ] Stand up demo site, running bleeding-edge Birdbox, so that it's easy to see components in use

[^1]: The exception here is the (forthcoming) demo site about birdbox, which WILL run off the bleeding-edge core repo
