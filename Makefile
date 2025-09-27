.DEFAULT_GOAL := rebuild

.PHONY: rebuild
rebuild:
	docker compose down
	docker compose up -d --build

.PHONY: logs
logs:
	docker logs --tail 100 -f mc-fabric

.PHONY: down
down:
	docker compose down

.PHONY: wipe
wipe:
	@echo -n "Are you sure you want to wipe the server? (y/n): "; \
	read answer; \
	if [ "$$answer" != "y" ] && [ "$$answer" != "Y" ]; then \
		echo "Aborting..."; \
		exit 1; \
	fi; \
	echo "Wiping server..."; \
	make down; \
	rm -rf mc-data; \
	make rebuild