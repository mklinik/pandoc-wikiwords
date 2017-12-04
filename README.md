# pandoc-wikiwords

A pandoc json filter that turns WikiWords into links

## Howto

  # install pandoc and pandoc-wikiwords
  $ stack install pandoc
  $ stack install
  # run pandoc
  $ pandoc --standalone --mathjax --css pandoc.css -t html test.markdown --filter pandoc-wikiwords-exe > test.html
