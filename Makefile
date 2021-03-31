install:
	python -m venv esb
	source esb/bin/activate
	sudo apt-get install libpq-dev python-dev
	pip install ipykernel
	ipython kernel install --user --name=esb
	pip install lux
	pip install pandas 
	pip install datasette
	datasette install datasette-graphql
	datasette install datasette-publish-vercel
	pip install datasette-vega
split-csv:
	headers=`head -1 data.csv`
	mkdir -p out && cd out && awk -F\, '{print >$1.csv}' ../data.csv && \
	ls -1 | while read file_name; do sed -i "1i $headers" "$file_name"; done
	rm "Channel Name"
insert-data:
	sqlite-utils insert esb.db runningtotal_export out/'"Active Energy A- A23 Total"' --csv
	sqlite-utils insert esb.db runningtotal_import out/'"Active energy A+ A14 Total"' --csv
	sqlite-utils insert esb.db interval_export out/'"Active Power P- P23_Avg"' --csv
serve:
	datasette serve esb.db
publish:
	vercel login
	datasette publish vercel esb.db --branch main --install datasette-graphql --install datasette-vega --project "esb-smart-meter"