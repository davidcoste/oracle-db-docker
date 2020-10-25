This project is for building an Oracle Database 12cR1 on Oracle Linux 7.8. Follow the instructions hereunder to use it

1. Place the binaries into sub folder binaries/soft
2. Build the image with the following command:

````
docker build . --tag oracle12c-so
````
3. Run the image with the following command:

````
docker run -it oracle12c-so  /bin/bash     
````
