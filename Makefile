.PHONY: rebuild
rebuild:
	docker compose down
	docker compose up -d --build