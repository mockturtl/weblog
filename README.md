weblog
======

This site is generated with [ruhoh][] v2.6.

###### setup

Download this [gist][], per the documentation.

preview
-------

```sh
$ ./tool/preview.sh
```

Visit [localhost:9292](http://localhost:9292).  View drafts at `/dash`.

publishing
----------

```sh
$ ./tool/deploy.sh
```

Note files in `*/drafts/` are not compiled.

Note ruhoh's deploy process **destroys** files not under version control.

GitHub Pages can be finicky with submodules.  If the site doesn't update, run the deploy script again.

[ruhoh]: http://ruhoh.com/
[gist]: https://gist.github.com/jaimalchohan/8090954
