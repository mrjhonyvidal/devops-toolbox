### Mule Standalone on Docker

For the experiment, first download Mule EE Standalone distribution

[Latest Mule Runtime EE Standalone](https://www.mulesoft.com/lp/dl/mule-esb-enterprise)

Download another versions that not the latest on [developer.mulesoft](https://developer.mulesoft.com/download-mule-esb-runtime)

Second, compile your Mule application targe file (.jar).
```
Inside your project, when using Maven: mvn clean package
```

Build the Docker image from the Dockerfile present in the current working directory and tags it:
```
docker build . -t my_image_name_tag
example: docker build . -t mule_standalone_4_3_0_docker_ubuntu_19_04
docker run -it --rm -p 8083:8083 my_image_name_tag 
```

Change in Dockerfile the port expose, in our case is 9082.
 
Uncomment: `COPY my-application-1.0.0-SNAPSHOT-mule-application.jar ${MULE_HOME}/apps`

Execute the following command to run the application by Mule runtime environment:
```
docker run -it --rm -p 8083:8083 my_image_name_tag
```
Output
```
Running in console (foreground) mode by default, use Ctrl-C to exit...
MULE_HOME is set to /opt/mule
MULE_BASE is set to /opt/mule
Running Mule Enterprise Edition...
Unable to resolve the default log file path '': No such file or directory
--> Wrapper Started as Console
Java Service Wrapper Standard Edition 64-bit 3.5.37
  Copyright (C) 1999-2018 Tanuki Software, Ltd. All Rights Reserved.
    http://wrapper.tanukisoftware.com
  Licensed to MuleSoft Inc. for Mule Runtime Enterprise Edition

Launching a JVM...
Starting the Mule Container...
WrapperManager: Initializing...

Valid license key --> Evaluation = true, Expiration Date = Sun Oct 25 00:00:00 UTC 2020, Contact Name = MuleSoft Support, Contact Email Address = support@mulesoft.com, Contact Telephone = support@mulesoft.com, Contact Company = MuleSoft, Contact Country = US, Entitlements = 


**********************************************************************
*                                                                    *
*                         (((((((((((((((((((                        *
*                     (((((                 ((((#                    *
*                  &(((                        *(((                  *
*                &(((                             (((                *
*               (((     (((%               (((#     (((              *
*              ((     (((((((             (((((((    (((             *
*             ((     (((((((((           (((((((((     ((            *
*            ((    #(((((((((((        #(((((((((((    (((           *
*           #((    ((((((((((((((     ((((((((((((((    ((           *
*           ((    ((((((  /(((((((   (((((((  /((((((    ((          *
*           ((    ((((((    (((((((&(((((((    ((((((    ((          *
*           ((    (((((      ((((((((((((*     ((((((    ((          *
*           ((    ((((((      *(((((((((       ((((((    ((          *
*           ((    ((((((        (((((((        ((((((   (((          *
*            ((    ((((((                     ((((((    ((           *
*            ((#    ((((((#                 (((((((    ((            *
*             ((#    ((((((((             ((((((((    (((            *
*              (((    (((((((              (((((     ((.             *
*                ((      (((               (((     #((               *
*                 /((                            (((                 *
*                    (((                      &(((                   *
*                      *((((&             &((((                      *
*                           ((((((((((((((/                          *
*                                                                    *
*    ___  ___      _        ______            _   _                  *
*    |  \/  |     | |       | ___ \          | | (_)                 *
*    | .  . |_   _| | ___   | |_/ /   _ _ __ | |_ _ _ __ ___   ___   *
*    | |\/| | | | | |/ _ \  |    / | | | '_ \| __| | '_ ` _ \ / _ \  *
*    | |  | | |_| | |  __/  | |\ \ |_| | | | | |_| | | | | | |  __/  *
*    \_|  |_/\__,_|_|\___|  \_| \_\__,_|_| |_|\__|_|_| |_| |_|\___|  *
*                                                                    *
*                                                                    *
* Mule Runtime and Integration Platform                              *
* Version: 4.3.0 Build: 5bb13483                                     *
* MuleSoft, Inc.                                                     *
* For more information go to                                         *
* https://www.mulesoft.com/platform/soa/mule-esb-enterprise          *
*                                                                    *
* Server started: 9/25/20 4:16 AM                                    *
* JDK: 1.8.0_265 (mixed mode)                                        *
* JDK properties:                                                    *
*  - java.vendor = Oracle Corporation                                *
*  - java.vm.name = OpenJDK 64-Bit Server VM                         *
*  - java.home = /usr/local/openjdk-8/jre                            *
* OS: Linux (4.19.76-linuxkit, amd64)                                *
* Host: 9fa1c7a02e01 (172.17.0.2)                                    *
* Mule services:                                                     *
*  - api-gateway-events-collector-service-1.1.0                      *
*  - mule-service-http-ee-1.6.0                                      *
*  - mule-service-weave-ee-2.3.0                                     *
*  - mule-service-scheduler-1.3.0                                    *
*  - api-gateway-contract-service-1.1.0                              *
*  - mule-service-oauth-ee-1.0.0                                     *
*  - mule-service-soap-1.3.0                                         *
* Applied artifact patches:                                          *
*  - APIKIT-2576-1.3.7-1.3.8-1.0.jar                                 *
*  - APIKIT-2612-1.0.0-1.0.2-1.1.0-1.0.jar                           *
*  - APIKIT-2612-1.1.1-1.0.jar                                       *
*  - APIKIT-2612-1.1.11-1.0.jar                                      *
*  - APIKIT-2612-1.1.12-1.2.0-1.2.2-1.0.jar                          *
*  - APIKIT-2612-1.1.13-1.1.14-1.2.3-1.2.4-1.0.jar                   *
*  - APIKIT-2612-1.1.15-1.1.16-1.0.jar                               *
*  - APIKIT-2612-1.1.2-1.0.jar                                       *
*  - APIKIT-2612-1.1.3-1.0.jar                                       *
*  - APIKIT-2612-1.1.4-1.0.jar                                       *
*  - APIKIT-2612-1.1.5-1.1.6-1.0.jar                                 *
*  - APIKIT-2612-1.1.7-1.0.jar                                       *
*  - APIKIT-2612-1.1.8-1.1.10-1.0.jar                                *
*  - APIKIT-2612-1.2.5-1.3.1-1.3.4-1.0.jar                           *
*  - APIKIT-2612-1.3.0-1.0.jar                                       *
*  - APIKIT-2612-1.3.5-1.3.9-1.0.jar                                 *
*  - APIKIT-2613-1.2.0-1.2.1-1.0.jar                                 *
*  - APIKIT-2613-1.2.2-1.0.jar                                       *
*  - APIKIT-2613-1.2.3-1.2.4-1.3.0-1.0.jar                           *
*  - APIKIT-2613-1.2.5-1.3.1-1.3.4-1.0.jar                           *
*  - APIKIT-2613-1.3.5-1.3.6-1.0.jar                                 *
*  - APIKIT-2613-1.3.7-1.3.8-1.0.jar                                 *
*  - APIKIT-2613-1.3.9-1.0.jar                                       *
*  - SE-12551-1.0.0-1.0.1-1.0.jar                                    *
*  - SE-12551-1.1.0-1.1.15-2.0.jar                                   *
*  - SE-12551-1.2.0-1.3.0-1.0.jar                                    *
*  - SE-12551-1.3.1-1.3.4-1.0.jar                                    *
*  - SE-12562-1.0.0-1.5.5-1.0.jar                                    *
* Mule system properties:                                            *
*  - mule.metadata.cache.expirationInterval.millis = 5000            *
*  - mule.base = /opt/mule                                           *
*  - mule.home = /opt/mule                                           *
*  - mule.metadata.cache.entryTtl.minutes = 10                       *
**********************************************************************

**********************************************************************
* Cluster configuration                                              *
*                                                                    *
* Cluster mode disabled                                              *
**********************************************************************

**********************************************************************
* Started domain 'default'                                           *
**********************************************************************

++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
+ Mule is up and kicking (every 5000ms)                                        +
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

**********************************************************************
*              - - + DOMAIN + - -               * - - + STATUS + - - *
**********************************************************************
* default                                       * DEPLOYED           *
**********************************************************************

```