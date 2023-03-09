FILE=Dockerfile
IMAGE_NAME=imagename
REGISTRY=vidyasg
REPOSITORY=docker
TAG_VERSION=$2
TOKEN=$1

if test -f "$FILE"; then
  echo "$FILE" exists
  echo "*************Docker image build started************"
  docker build -t $IMAGE_NAME .
  echo "*************Docker image build completed***********"
  echo "*************Push docker image to docker hub***********"
  docker tag $IMAGE_NAME $REGISTRY/$REPOSITORY:$TAG_VERSION
  docker login -u $REGISTRY -p $TOKEN
  docker push $REGISTRY/$REPOSITORY:$TAG_VERSION
else
  echo "**********Dockerfile doesnot exists*************"
fi
