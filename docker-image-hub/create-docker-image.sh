# First, find the Container ID of the running container you want to convert into an image:

docker ps

# 2️⃣ Commit the Container to an Image

docker commit <container_id> <new-image-name>:<tag>
# Run the following command, replacing <container_id> with the actual Container ID and <new-image-name> with your desired image name:

# Example:
docker commit 07a27ba75c03 reeplay-typescript:v1



# 3️⃣ Verify the Image Exists
docker images
