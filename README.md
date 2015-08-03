# RuckusTEST
Exercise

1. Use Groovy to implement a RESTful API web application.
http://ratpack.io or https://grails.org for RESTful API implementation, or any framework you want to use.

2. Use Robotframework (http://robotframework.org) to write a test case to search "Ruckus Wireless" on Google, and check if any result found.

3. Export a RESTful API endpoint to run the test case.

4. Use Gradle & Docker to package the application to container.

5. Send me the Docker container and prepare a readme file to teach me how to use.

# Introduction
This is the sample for Ruckus's Exercise.
Implement a REST server ahd be the endpoint to start the Google Search by Robotframework.
This application package into Docker's container

# Example
##First download this image from 
https://registry.hub.docker.com/u/chaircos/rest/

##Second deploy and run the image on the container
MAX OS X sample: </br>
###2.1 creareVM: boot2docker init
###2.2 startup: boot2docker start
###2.3 run image: run -d -p 80:5000 --name rests rest

# How to Develop
git clone https://github.com/chairco/RuckusTEST.git
the tree will like below:</br>
├── Dockerfile </br>
├── GoogleDemo </br>
│   ├── google_search.txt </br>
│   ├── log.html </br>
│   ├── output.xml </br>
│   ├── report.html </br>
├── README.md </br>
├── mockflask.py </br>
├── .gitignore </br>
└── requirements.txt </br>

###1. mockflask.py
   REST Server, by flask web framework
###2. google_search.txt
   robot script
###3. Dockfile
   build the image need
###4. requirements
   python packages


