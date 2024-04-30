IMAGE_NAME = quake-log-parser

DEFAULT_OUTPUT_FILE = resources/game_stats.json

build:
	docker build . -t $(IMAGE_NAME):latest
run:
	@read -p "Do you want to open the output file? (y/n): " open_file && \
	if [ $$open_file = "y" ]; then \
		docker run -v $(PWD):/app $(IMAGE_NAME):latest ruby parser.rb $(LOG_FILE) $(OUTPUT_FILE) && \
		cat $(OUTPUT_FILE); \
	else \
		docker run -v $(PWD):/app $(IMAGE_NAME):latest ruby parser.rb $(LOG_FILE) $(OUTPUT_FILE); \
	fi	
test:
	docker run -it $(IMAGE_NAME):latest rspec

lint:
	docker run -it $(IMAGE_NAME):latest rubocop -A