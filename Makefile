image:
	docker build -t r1 .

clean:
	docker image rm -f r1

start: image
	docker run -p 0.0.0.0:5000:5000 -it r1
