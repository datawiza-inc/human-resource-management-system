TAG=$(git branch --show-current)
docker build --target datawiza-hrm-app -t registry.gitlab.com/datawiza/datawiza-hrm-app:${TAG} .
docker build --target datawiza-hrm-app-db -t datawiza-hrm-app-db .