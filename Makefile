
all: talk.html talk.notes

dist: all
	tar zcvf secprog-tpc2002-1.tgz talk.* Makefile maketalk makenotes

clean:
	rm talk.html talk.notes talk.inter pod2htm*

talk.inter: talk.pod
	pod2html --flush --noindex --css talk.css talk.pod > talk.inter

talk.html: talk.inter maketalk
	./maketalk talk.inter > talk.html

talk.notes: talk.pod makenotes
	./makenotes talk.pod > talk.notes

