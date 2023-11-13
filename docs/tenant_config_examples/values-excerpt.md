# Env vars needed in `values.yaml`

Look for the `env` section and ensure the following are present

```...
env:
  basket_newsletter_data_do_sync: "False"
  google_tag_id: "<insert Google Tag Manager ID here, if relevant else leave as an empty string>"
  secure_hsts_seconds: "31536000"
  is_https: "True"
...
```
