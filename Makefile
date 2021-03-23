install:
	python -m venv esb
	source esb/bin/activate
	sudo apt-get install libpq-dev python-dev
	pip install ipykernel
	ipython kernel install --user --name=esb
	pip install lux
	pip install pandas 
split-csv:
	mkdir out && cd out && awk -F\, '{print >$1.csv}' ../data.csv