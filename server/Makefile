GOLANG_MIGRATE := github.com/golang-migrate/migrate/v4/cmd/migrate@v4.15.2
SQLBOIKER := github.com/volatiletech/sqlboiler/v4@v4.11.0
SQLBOIKER_POSTGRES := github.com/volatiletech/sqlboiler/v4/drivers/sqlboiler-psql@v4.11.0
WIRE := github.com/google/wire/cmd/wire@v0.5.0
MOCKERY := github.com/vektra/mockery/v2@v2.12.3

# Build Binary for each entrypoints.
build:
	go build -o ./bin cmd/main.go

build-image:
	docker build -f build/Dockerfile -t $(REGION)-docker.pkg.dev/$(PROJECT_ID)/cloud-run-exercise-main/api-server:dev .

push-image: build-image
		docker push $(REGION)-docker.pkg.dev/$(PROJECT_ID)/cloud-run-exercise-main/api-server:dev
