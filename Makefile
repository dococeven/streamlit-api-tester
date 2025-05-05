# Variables
VENV_NAME ?= venv
PYTHON = $(VENV_NAME)/bin/python
PIP = $(VENV_NAME)/bin/pip
STREAMLIT = $(VENV_NAME)/bin/streamlit

# Default target (run the app)
run: venv
	$(STREAMLIT) run app.py

# Set up a virtual environment
venv:
	python -m venv $(VENV_NAME)
	$(PIP) install --upgrade pip
	$(PIP) install -r requirements.txt

# Install dependencies
install: venv
	$(PIP) install -r requirements.txt

# Git: Pull latest changes
sync-pull:
	git pull origin $(GIT_BRANCH)

# Git: Commit and push (usage: `make sync-push M="Your commit message"`)
sync-push:
	git add .
	git commit -m "$(M)"
	git push origin $(GIT_BRANCH)

# Clean up virtual environment
clean:
	rm -rf $(VENV_NAME)
	rm -rf __pycache__

# Run tests (example: add pytest later)
test: venv
	$(PYTHON) -m pytest tests/

# Lint code (example: flake8)
lint: venv
	$(PYTHON) -m flake8 app.py

.PHONY: run install clean test lint
