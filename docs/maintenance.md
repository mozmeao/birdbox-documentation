# Maintenance

!!! note "Design philosophy"

    Every site created with Birdbox runs off a fork of the main project.

    This was a deliberate design decision, trying to balance maintainability and stability with increasing functionality.

    As such, a fix made to the core repository must be able to be flowed downstream to its forks. Care must be taken to ensure this can happen _in a way that does not break those forks_.

For documentation on carrying out actual maintenance work, please see [Extending](./extending.md).

## Dependency update policy

Core `mozmeao/birdbox` runs Github Dependabot alerts for both security vulnerabilities and regular dependency updates.

We will proactively keep core birdbox as up to date as practical:

* General dependency updates to the core codbase will be flowed downstream to all forks within 14 days of them landing in core.
* Security dependency updates to the core codebase will be flowed downstream within 24 business hours of them landing in core.

## Steps for updating a downstream fork

Once a change/fix has landed in core `mozmeao/birdbox` and you have identified which downstream fork you want to update (first - you'll need to do them all, ultimately), here's a process to use.

(Here we'll refer to an existing, earlier-made fork as `forkedsite`. Forks should have an `upstream` remote, which is `mozmeao/birdbox`. You can check this with `more .git/config` in a local checkout of `forkedsite`.)

1. Check out the `main` branch of `forkedsite` and ensure you're up to date. e.g. `git switch main && git pull --ff-only`
2. Fetch the latest state of upstream's main branch: `git fetch upstream main`
3. Compare it with the fork's main: `git diff upstream/main..HEAD`
4. Sync `forkedsite:main` to be the same as `birdbox:main` with `git merge upstream/main --ff-only` (or [use the Github UI](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/syncing-a-fork))
5. Check the log `forkedsite` and ensure it has all the commits that you'd expect from `mozmeao/birdbox`
6. Push up the changes to the Github repo for `forkedsite`: `git push origin main`. This will trigger CI on that repo and also deploy it to the dev service.
7. Check that CI is all green and that the Dev service is happy. Deploy to stage and then prod as per [Extending](./extending.md).

(Suggestions for improvements to this process are very welcome.)

## Reporting Security vulnerabilities

If you believe that you've found a Mozilla-related security vulnerability in `mozmeao/birdbox`, please report it by sending an email to <security@mozilla.org>.
