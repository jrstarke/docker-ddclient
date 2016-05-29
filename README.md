# docker-ddclient

This repository is used to build a base Docker image for deploying ddclient: [jrstarke/docker-ddclient](https://hub.docker.com/r/jrstarke/docker-ddclient).

## Usage

Create a `ddclient.conf` file that contains the configuration for your ddclient, based on the [sample configuration](https://sourceforge.net/p/ddclient/code/HEAD/tree/tags/release-3.8.3/sample-etc_ddclient.conf).

Add a `Dockerfile` with the following contents to the root directory of your ddclient instance's repository:

``` Dockerfile
FROM jrstarke/docker-ddclient
```

That's all you need.

Build the image for your ddclient with this command from the root of your repository:

``` bash
docker build -t <your image name> .
```

Replace `<your image name>` with a custom name for your ddclient image.

Now start the ddclient container:

``` bash
docker run -d --name ddclient --restart always <your image name>
```

ddclient is now running!

To deploy a new version of your ddclient, commit or pull any changes to the repository, rerun the command to build the image, then stop, remove, and start the ddclient container again:

~~~ bash
docker build -t <your image name> .
docker stop ddclient
docker rm ddclient
docker run -d --name ddclient --restart always <your image name>
~~~

## License

[MIT](http://opensource.org/licenses/MIT)
