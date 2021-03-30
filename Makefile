all: set-git set-pre-commit set-test set-lint set-pipreqs
dev-env: set-git set-pre-commit set-test set-lint set-pipreqs
dep: extract-requirements
test: pytest
clean: clean-pyc clean-test

##### dev-env #####
set-git:
	git config --local commit.template .gitmessage.txt

set-pre-commit:
	pip3 install --no-cache-dir pre-commit
	pre-commit install

set-lint:
	pip3 install pylint==2.7.4

set-test:
	pip3 install --no-cache-dir pytest==6.2.1 pytest-cov==2.10.1 pytest_xdist==2.2.0

set-pipreqs:
	pip3 install --no-cache-dir pipreqs==0.4.10

#####   dep   #####
extract-requirements:
	pipreqs --force --savepath requirements.txt src

pytest:
	pytest -o log_cli=true -n 1 --cov-report term-missing tests/

#####  clean  #####
clean-pyc:
	find . -name '*.pyc' -exec rm -f {} +
	find . -name '*.pyo' -exec rm -f {} +
	find . -name '*~' -exec rm -f {} +
	find . -name '__pycache__' -exec rm -fr {} +

clean-test:
	rm -f .coverage
	rm -f .coverage.*
	rm -rf .pytest_cache
	rm -rf .mypy_cache
