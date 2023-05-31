#!make

create_venv:
	python3 -m venv venv

activate_venv:
	. .venv/bin/activate

deactivate_venv:
	deactivate

install_requirements:
	pip install -r requirements.txt

test:
	curl -X POST -H "Content-Type: application/json" -d '{"text":"what are the best romcoms in the world?"}' http://localhost:5000/get_embedding