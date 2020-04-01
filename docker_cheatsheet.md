Build an image from current directory
`docker build .`

Create a new container from an image with interactive shell
`docker run -it image_id`

Same with mounting a directory inside the container
`docker run -v /absolute/path/to/directory:/container/mount/point -it image_id`

List images
`docker images`
`docker image ls`

List running containers
`docker ps`

List all containers
`docker ps -a`

Remove container
`docker rm container_id`

Remove all stopped containers
`docker rm $(docker ps -a -q)`

Remove all images
`docker image rm $(docker image ls -q)`

Pull an image
`docker pull image_name`
