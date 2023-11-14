# Env vars needed in a `values-{ENV}.yaml` file

Look for the `env` section and ensure the following are present, adapting/updating as appropriate.

The CSP config below may not be identical for every site, but it's a very good start

```...
env:
  app_name: NEWSITE-prod  # or -stage or -dev
  base_site_url: https://NEWSITE.mozilla.org  # or the internal domain https://ENV.NEWSITE.CLUSTER.SUBDOMAIN.DOMAIN.TLD
  csp_enabled: True
  csp_report_only: False  # You may want to make this True, initially
  csp_connect_src: "'self' https://region1.google-analytics.com https://basket.mozilla.org www.google-analytics.com"
  csp_frame_src: "'self' www.youtube-nocookie.com www.youtube.com player.vimeo.com"
  csp_img_src: "'self' data: https://storage.googleapis.com/RELEVANT_STORAGE_BUCKET_NAME_HERE/ https://region1.google-analytics.com https://www.googletagmanager.com"
  csp_script_src: "'self' www.googletagmanager.com"
  csp_reporting_endpoint: GET_THIS_FROM_SENTRY # See Birdbox documentation for guidance
  sentry_dsn: GET_THIS_FROM_SENTRY  # See Birdbox documentation for guidance
  wagtailadmin_base_url: https://NEWSITE.mozilla.org ## or the internal domain https://ENV.NEWSITE.CLUSTER.SUBDOMAIN.DOMAIN.TLD -- note no trailing slash or path to /admin/
...
```
