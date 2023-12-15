FROM jekyll-base as jekyll-server

EXPOSE 4000

WORKDIR /site

ENTRYPOINT [ "entry.sh" ]

CMD [ "bundle","exec","jekyll","serve", "-H", "0.0.0.0", "-P", "4000" ]