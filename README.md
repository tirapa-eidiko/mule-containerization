# mule-containerization

Below is the list of steps you have to follow in order to work with this repository on containerising mule standalone runtime 4.3.0 and deploying applications into mule standalone Enterprise runtime 4.3.0

Pre-reqs:
=======================================================
1) Git should be installed on your local system.
2) Docker should be installed on your local system.
3) Mule EE standalone server "mule-ee-distribution-standalone-4.3.0.zip" should be downloaded from mulesoft site

STEP-0: Clone this git repository in your local system:
=======================================================

Clone this repository using "git clone https://github.com/tirapa-eidiko/mule-containerization" 

STEP-1:Download Mule Enterprize Standalone Server form Mulesoft site:
====================================================================
Download mule-ee-distribution-standalone-4.3.0.zip from Mulesoft website and place it in "mule-containerization" folder.

STEP-2: Build docker image for Mule EE Standalone Server:
=========================================================

Run "docker build . -t tirapareddy/mule:4.3.0" for building mule standalone runtime 
.
      The above command builds a mule ee 4.3.0 container images and deployes the domain project "pro-domain-1.0.0-SNAPSHOT-mule-domain.jar" into standalone ee mule runtime.
      
STEP-3: Run ocker image for Mule EE Standalone Server(Optional):
================================================================

Run "docker run -it --rm -p 9082:9082 tirapareddy/mule:4.3.0"
        The docker run command instanciates tirapareddy/mule contaier and that host the mule ee standalone runtimen and domain project with shared resources.
        
STEP-4: Switch MuleApps folder to deploy Mule applications:
===========================================================

Now goto "MuleApps" folder "cd ./MuleApps". The MuleApps folder conttains apps sub-folder, any mule application whcich is placed in apps folder will be deployed into mule ee standalone 4.3.0 runtime.

STEP-5: Build Mule EE Standalone Runtime Image With Mule Applications:
======================================================================

You are in "../mule-containerization/MuleApps/" folder. Now run "docker build . -t tirapareddy/muleapps:4.3.0"
        The above docker run command create a docker imager tirapareddy/muleapps with verion 4.3.0.
        
STEP-6: Instanciate Mule Runtime With Applications:
===================================================

Now run "docker run -it --rm -p 9082:9082 tirapareddy/muleapps:4.3.0".
        This docker run command will deploy "mule-docket-application.jar" form "../mule-containerization/MuleApps/apps" into mule ee standalone 4.3.0 runtime. Additionally, you can place your own mule applications in this folder so that they will be deployed into mule runtie when you instanciate this container image.
        
STEP-7: Access Mule Application from your system:
=================================================
     Open browser and hit "http://localhost:9082/docker"
