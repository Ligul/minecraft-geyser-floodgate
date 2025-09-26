.DEFAULT_GOAL := rebuild

.PHONY: rebuild
rebuild:
	docker compose down
	docker compose up -d --build

.PHONY: logs
logs:
	docker logs --tail 100 -f mc-fabric