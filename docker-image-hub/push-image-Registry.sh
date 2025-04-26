# 4️⃣ Tag the Image for a Registry
# If you want to push the image to a registry like Docker Hub or AWS ECR, tag it appropriately:

docker tag reeplay-typescript:v1 incrisz/reeplay-typescript:v1

# 5️⃣ (Optional) Push to a Registry
# To push it to Docker Hub:
docker push incrisz/reeplay-typescript:v1


# To push it to AWS ECR, first authenticate, then push:
aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 637423435427.dkr.ecr.us-east-1.amazonaws.com

docker tag reeplay-typescript:v1 637423435427.dkr.ecr.us-east-1.amazonaws.com/reeplay/typescript:v1

docker images | grep reeplay-typescript

docker push 637423435427.dkr.ecr.us-east-1.amazonaws.com/reeplay/typescript:v1

aws ecr list-images --repository-name reeplay/typescript --region us-east-1
