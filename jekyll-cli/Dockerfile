FROM jekyll-base as jekyll-cli

WORKDIR /site

ENTRYPOINT [ "entry.sh" ]

CMD ["bundle", "exec", "jekyll","--help"]