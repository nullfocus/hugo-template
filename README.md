# Hugo Template
This is a template repo for building new Hugo sites. The main features:

- uses `hugomods/hugo:exts` docker container, which is always running the latest Hugo build
- includes a _Github Actions_ deployment script publishing to **Netlify**

# Setup

1. Use this repo as a template for a new repo

2. Run the following to populate the `/src` folder with a new blank Hugo site

```
make init
```

3. Pick one of the many [Hugo themes](https://themes.gohugo.io/) and follow its install guide

OR

3. Set up the scaffolding for your Hugo site (a bit advanced)

4. Run the following to start the Hugo server locally 

```
make serve
```
5. Navigate to [localhost:1313](http://localhost:1313)


# Netlify deployment setup

In your repo, create secrets for `NETLIFY_AUTH_TOKEN` and `NETLIFY_SITE_ID`. Populate them with values from your Netlify login.