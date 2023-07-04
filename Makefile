VENV = venv
PYTHON = $(VENV)/bin/python3
PIP = $(VENV)/bin/pip
PACKAGE = flask
# what flask app to run
APP = hello
# for dev use development
# for prod use production
ENV_FLASK = development

# Defines the default target that `make` will to try to make, or in the case of a phony target, execute the specified commands
# # This target is executed whenever we just type `make`
.DEFAULT_GOAL = help

.PHONY: setup
setup: ## - setup python virtual environment
	python3 -m venv venv
	$(PIP) install --upgrade pip
	$(PIP) install $(PACKAGE)


.PHONY: run
run: ## - run program with  python virtual environment

	#$(VENV)/bin/activate
	#export FLASK_APP=$(APP)
	#export FLASK_ENV=$(ENV_FLASK)
	export FLASK_APP=$(APP) && export FLASK_ENV=$(ENV_FLASK) && venv/bin/flask run

.PHONY: clean
clean: ## - clean python cache and remove python virtual environment
	 rm -rf __pycache__
	rm -rf $(VENV)

# create help from ## after command
help:
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
