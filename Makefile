postgres:
	docker run --name postgres12 -p 5432:5432 -e POSTGRES_USER=root_ -e POSTGRES_PASSWORD=secret -d postgres:12-alpine

createdb:
	docker exec -it postgres12 createdb --username=root_ --owner=root_ simple_bank

dropdb:
	docker exec -it postgres12 dropdb -U root_ simple_bank

migrateup:
	migrate -path db/migration -database "postgresql://root_:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up

migratedown:
	migrate -path db/migration -database "postgresql://root_:secret@localhost:5432/simple_bank?sslmode=disable" -verbose down
.PHONY: postgres createdb dropdb migrateup migratedown