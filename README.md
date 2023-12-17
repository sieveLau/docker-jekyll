DockerHub: [sievelau/jekyll](https://hub.docker.com/r/sievelau/jekyll)

## Usage

Mount your jekyll site folder (the one containing `Gemfile`) into `/site` and (optionally) mount a cache directory to `/usr/local/bundle` for caching gems, and pass your bundle command to the container:

```bash
docker run --rm -v $(pwd):/site -v $(pwd)/.cache:/usr/local/bundle sievelau/jekyll:cli bundle exec jekyll build
```

For starting a live server for preview, use the `server` tag:

```bash
docker run --rm -p 4000:4000 -v $(pwd):/site -v $(pwd)/.cache:/usr/local/bundle sievelau/jekyll:server
```

## How it works

The image works on `/site`. The container will search for the `Gemfile` in the `/site` folder and:

1. if it finds one, it will run `bundle install` to prepare the dependencies.
2. if there is none, it will run `gem install jekyll` to make `jekyll` command available (so you can init a new jekyll site).

The above behaviour is controlled by [entry.sh](/entry.sh).

After that, the `cli` tag variant will run the command you gave while the `server` variant will start a jekyll live server on port 4000.

Basically, the two tags are the same, except that the `server` tag will execute the command to start the jekyll local server by default, while the `cli` will not do anything meaningful.


## Thanks

This repository is a modified version of [jekyll-serve](https://github.com/BretFisher/jekyll-serve/tree/main) by [Bret Fisher](https://github.com/BretFisher). I have added some new features and improved some existing ones. You can find the original project here: [jekyll-serve](https://github.com/BretFisher/jekyll-serve/tree/main).
