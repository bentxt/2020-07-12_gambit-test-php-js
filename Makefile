GSC=../gsc/gsc -:=.. -target php 
GSC=gsc -target php 

vif: all

all: run_php

lib.js: lib.scm
	$(GSC) -c lib.scm

libphp.php: libphp.scm
	$(GSC) -c libphp.scm 

app.js: app.scm
	$(GSC) -c app.scm


app.php: app.scm
	$(GSC) -c app.scm

app_.js: lib.js app.js
	$(GSC) -link -l lib app.js

app_.php: libphp.php app.php
	$(GSC) -link -l libphp app.php


linked_app.js: lib.js app.js app_.js
	$(GSC) -c lib.scm
	cat app_.js lib.js app.js > linked_app.js
	wc *.js

linked_app.php: libphp.php app.php app_.php
	#$(GSC) -c libphp.scm
	cat app_.php funs.php libphp.php app.php > linked_app.php
	wc *.php

run_js: linked_app.js
	node linked_app.js

run_php: linked_app.php
	php linked_app.php

clean:
	rm -f lib.js app.js app_.js linked_app.js
	rm -f lib.php app.php app_.php linked_app.php

distclean: clean
	rm -f *.tar.gz
	rm -f *.html

doc: 
	pandoc -s article.md > article.html

