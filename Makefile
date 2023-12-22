magic: build interact

build:
	docker build -t fortran-aoc .

interact:
	docker run -it --entrypoint bash fortran-aoc
