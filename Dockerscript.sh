FILE=Dockerfile
IMAGE_NAME=imagename
REGISTRY=499756076901.dkr.ecr.eu-west-3.amazonaws.com
REPOSITORY=test
TAG_VERSION=$1
REGION=eu-west-3 
AWS_ACCOUNT_ID=499756076901

if test -f "$FILE"; then
  echo "$FILE" exists
  echo "*************Docker image build started************"
  docker build -t $IMAGE_NAME .
  echo "*************Docker image build completed***********"
  echo "*************Push docker image to docker hub***********"
  docker tag $REPOSITORY:$TAG_VERSION $REGISTRY/$REPOSITORY:$TAG_VERSION
  aws ecr get-login-password --region $REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$REGION.amazonaws.com
  docker push $REGISTRY/$REPOSITORY:$TAG_VERSION
else
  echo "**********Dockerfile doesnot exists**************"
fi
