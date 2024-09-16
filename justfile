compile-requirements:
    pip install -U uv
    # start with a clean slate each time
    rm requirements.txt
    uv pip compile --generate-hashes --no-strip-extras requirements.in -o requirements.txt

preflight:
    pip install -r requirements.txt

serve:
    mkdocs serve

help:
	@echo "Please use \`just <target>' where <target> is one of"
	@echo "  preflight  - install Python requirements; do any other setup tasks"
	@echo "  serve      - run a local mkdocs server to see your edits live"
