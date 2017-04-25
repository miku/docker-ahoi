build-image:
	docker build -t r1 .

clean-image:
	docker image rm -f r1

start:
	docker run -p 0.0.0.0:5000:5000 -it r1
