default: build

build:
	docker build -t wkhtmltopdf-builder .
	CID=`docker run --platform linux/amd64 -d wkhtmltopdf-builder --version`; \
	docker cp $$CID:/usr/bin/wkhtmltopdf .; \
	docker rm $$CID;

install:
	cp wkhtmltopdf /usr/local/bin/

clean:
	rm wkhtmltopdf
