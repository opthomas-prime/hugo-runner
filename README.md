# hugo-runner

This image can be used to build and host gohugo.io websites statelessly.

You only need to specify `HUGO_WEBSITE_REPO` for a minimal setup. Example:

```
docker run --rm -ti -e HUGO_WEBSITE_REPO=https://user:pass@example.org/website.git -p 80:80 tmsmr/hugo-runner
```

For the sake of simplicity only HTTPS remotes are supported.

After an initial build, the `run.sh` script will pull and build the website every hour.

Overwrite `/etc/nginx/nginx.conf` if you need to customize NGINX.
