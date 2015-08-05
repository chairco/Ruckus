FROM ubuntu:12.04                                                                                                                                                                    
#FROM python:2.7                                                                                                                                                                     
ADD . .                                                                                                                                                                              
                                                                                                                                                                                     
# make sure the package repository is up to date                                                                                                                                     
#RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list                                                                                       
RUN apt-get update                                                                                                                                                                   
                                                                                                                                                                                     
# Install vnc, xvfb in order to create a 'fake' display and firefox                                                                                                                  
# RUN apt-get install -y python-pip                                                                                                                                                  
#RUN apt-get install -y wget                                                                                                                                                         
RUN apt-get install -y python-all                                                                                                                                                    
RUN apt-get install -y python-pip                                                                                                                                                    
RUN apt-get install -y xvfb                                                                                                                                                          
RUN apt-get install -y firefox                                                                                                                                                       
#RUN apt-get install -y zip                                                                                                                                                          
#RUN apt-get install -y x11vnc                                                                                                                                                        
#RUN apt-get install -y chromium-browser                                                                                                                                             
                                                                                                                                                                                     
# Paramter setting                                                                                                                                                                   
#RUN mkdir ~/.vnc                                                                                                                                                                    
# Setup a password                                                                                                                                                                   
#RUN x11vnc -storepasswd 1234 ~/.vnc/passwd                                                                                                                                          
# Autostart firefox (might not be the best way to do it, but it does the trick)                                                                                                      
#RUN bash -c 'echo "firefox" >> /.bashrc'                                                                                                                                            
                                                                                                                                                                                     
# Install Chrome                                                                                                                                                                                                                                                                                                                                        
#RUN wget http://chromedriver.storage.googleapis.com/2.16/chromedriver_linux64.zip                                                                                                   
#RUN unzip chromedriver_linux64.zip                                                                                                                                                  
#RUN mv -f chromedriver /usr/local/share/chromedriver                                                                                                                                
#RUN ln -s -f /usr/local/share/chromedriver /usr/local/bin/chromedriver                                                                                                              
#RUN ln -s -f /usr/local/share/chromedriver /usr/bin/chromedriver                                                                                                                    
                                                                                                                                                                                     
# Install Chrome                                                                                                                                                                     
#RUN wget http://chromedriver.storage.googleapis.com/2.16/chromedriver_linux64.zip chromedriver_linux64.zip                                                                          
#RUN unzip chromedriver_linux64.zip                                                                                                                                                  
#RUN mv chromedriver /usr/local/bin/                                                                                                                                                 
                                                                                                                                                                                     
# Install python package                                                                                                                                                             
RUN pip install -r requirements.txt                                                                                                                                                  
#RUN pip install flask                                                                                                                                                               
#RUN pip install selenium                                                                                                                                                            
#RUN pip install requests                                                                                                                                                            
#RUN pip install pyvirtualdisplay                                                                                                                                                    
#RUN pip install robotframework                                                                                                                                                      
#RUN pip install robotframework-selenium2library                                                                                                                                     
#RUN pip install robotframework-requests
#RUN pip install robotframework-httplibrary                                                                                                                                          
                                                                                                                                                                                     
# Install firefox version 30                                                                                                                                                         
#RUN wget http://ftp.mozilla.org/pub/mozilla.org/firefox/releases/30.0/linux-x86_64/en-US/firefox-30.0.tar.bz2                                                                       
#RUN tar -xjvf firefox-30.0.tar.bz2                                                                                                                                                  
#RUN mv firefox /opt/firefox30.0                                                                                                                                                     
#RUN ln -sf /opt/firefox30.0/firefox /usr/bin/firefox                                                                                                                                
                                                                                                                                                                                     
#ENV DISPLAY :0                                                                                                                                                                      
CMD python mockflask.py