# Variables
VENV_NAME ?= venv
PYTHON = $(VENV_NAME)/bin/python
PIP = $(VENV_NAME)/bin/pip
STREAMLIT = $(VENV_NAME)/bin/streamlit
GIT_BRANCH ?= main



# Targets
run: venv
	$(STREAMLIT) run app.py

run2: venv
	$(STREAMLIT) run app2.py

run3: venv
	$(STREAMLIT) run app3.py

# Create virtual environment (if missing)
venv:
	test -d $(VENV_NAME) || python3 -m venv $(VENV_NAME)
	$(VENV_NAME)/bin/python -m pip install --upgrade pip
	$(VENV_NAME)/bin/python -m pip install -r requirements.txt

install: venv
	$(PIP) install -r requirements.txt

sync-pull:
	git pull origin $(GIT_BRANCH)

sync-push:
	git add .
	git commit -m "$(M)"
	git push origin $(GIT_BRANCH)

clean:
	rm -rf $(VENV_NAME)
	rm -rf __pycache__

test: venv
	$(PYTHON) -m pytest tests/

lint: venv
	$(PYTHON) -m flake8 app.py

activate:
	@echo "Run this command manually:"
	@echo "source $(VENV_NAME)/bin/activate  # Linux/macOS"
	@echo ".\$(VENV_NAME)\Scripts\activate   # Windows"

help:
	@echo "Available targets:"
	@echo "  run       - Launch Streamlit app (app.py)"
	@echo "  run2      - Launch Streamlit app (app2.py)"
	@echo "  run3      - Launch Streamlit app (app3.py)"
	@echo "  venv      - Create virtual environment and install dependencies"
	@echo "  install   - Install dependencies"
	@echo "  sync-pull - Pull latest Git changes"
	@echo "  sync-push - Commit and push changes (use M='message')"
	@echo "  clean     - Remove virtual environment and cache"
	@echo "  test      - Run pytest"
	@echo "  lint      - Run flake8 linting"

.PHONY: run run2 run3 venv install sync-pull sync-push clean test lint activate help