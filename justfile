compile-requirements:
    pip install -U pip
    pip install pip-tools
    pip-compile --generate-hashes -r requirements.in --resolver=backtracking --rebuild

preflight:
    pip install -r requirements.txt

serve:
    mkdocs serve

help:
	@echo "Please use \`just <target>' where <target> is one of"
	@echo "  preflight  - install Python requirements; do any other setup tasks"
	@echo "  serve      - run a local mkdocs server to see your edits live"
