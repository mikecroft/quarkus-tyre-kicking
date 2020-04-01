APP_NAME=remote-development
PROJECT=$(oc project -q)
# DOCKERFILE=src/main/docker/rdev-min.Dockerfile
DOCKERFILE="src/main/docker/remote-dev.Dockerfile"

# cleanup
oc delete dc $APP_NAME ; oc delete svc $APP_NAME ; oc delete bc $APP_NAME ; oc delete is $APP_NAME

# create & build
echo "create BC based on $DOCKERFILE"
cat $DOCKERFILE | oc new-build --name=$APP_NAME -D - 

echo "start build"
oc start-build $APP_NAME --from-dir=. --follow

# run new container
oc new-app --name=$APP_NAME $PROJECT/$APP_NAME:latest