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
```

Output
```
 ~/devo/devops-swissarmyknife/d/mule-standalone │ master +3 !3  docker build . -t my_app     ✔ │ base Py 

 ~/devo/devops-swissarmyknife/d/mule-standalone │ master +3 !3  docker build . -t mule_standalone_4_3_0_docker_ubuntu_19_04
Sending build context to Docker daemon  320.6MB
Step 1/15 : FROM ubuntu:19.04
19.04: Pulling from library/ubuntu
4dc9c2fff018: Pull complete 
0a4ccbb24215: Pull complete 
c0f243bc6706: Pull complete 
5ff1eaecba77: Pull complete 
Digest: sha256:2adeae829bf27a3399a0e7db8ae38d5adb89bcaf1bbef378240bc0e6724e8344
Status: Downloaded newer image for ubuntu:19.04
 ---> c88ac1f841b7
Step 2/15 : FROM openjdk:8
8: Pulling from library/openjdk
57df1a1f1ad8: Pull complete 
71e126169501: Pull complete 
1af28a55c3f3: Pull complete 
03f1c9932170: Pull complete 
881ad7aafb13: Pull complete 
db6a1d457bc3: Pull complete 
b7fe4ef08350: Pull complete 
Digest: sha256:202f23811f6cf23df64b2633f42bd46f8a597bdda26b6ea07259379a9da39c39
Status: Downloaded newer image for openjdk:8
 ---> db530b5a3ccf
Step 3/15 : ENV BUILD_DATE=09252020
 ---> Running in 0df6b38213d7
Removing intermediate container 0df6b38213d7
 ---> bade8fa218df
Step 4/15 : ENV MULE_HOME=/opt/mule
 ---> Running in da7520b8b532
Removing intermediate container da7520b8b532
 ---> 16c804de272d
Step 5/15 : ENV MULE_VERSION=4.3.0
 ---> Running in 91d939c40044
Removing intermediate container 91d939c40044
 ---> d03300732599
Step 6/15 : RUN mkdir mulezip
 ---> Running in 7209349d322a
Removing intermediate container 7209349d322a
 ---> 1835c28a0e27
Step 7/15 : RUN ls -la
 ---> Running in a7e9b8e68b2e
total 76
drwxr-xr-x   1 root root 4096 Sep 25 04:06 .
drwxr-xr-x   1 root root 4096 Sep 25 04:06 ..
-rwxr-xr-x   1 root root    0 Sep 25 04:06 .dockerenv
drwxr-xr-x   1 root root 4096 Sep 10 07:03 bin
drwxr-xr-x   2 root root 4096 Jul 10 21:04 boot
drwxr-xr-x   5 root root  340 Sep 25 04:06 dev
drwxr-xr-x   1 root root 4096 Sep 25 04:06 etc
drwxr-xr-x   2 root root 4096 Jul 10 21:04 home
drwxr-xr-x   1 root root 4096 Sep 10 00:59 lib
drwxr-xr-x   2 root root 4096 Sep  8 07:00 lib64
drwxr-xr-x   2 root root 4096 Sep  8 07:00 media
drwxr-xr-x   2 root root 4096 Sep  8 07:00 mnt
drwxr-xr-x   2 root root 4096 Sep 25 04:06 mulezip
drwxr-xr-x   2 root root 4096 Sep  8 07:00 opt
dr-xr-xr-x 189 root root    0 Sep 25 04:06 proc
drwx------   1 root root 4096 Sep 10 07:05 root
drwxr-xr-x   3 root root 4096 Sep  8 07:00 run
drwxr-xr-x   1 root root 4096 Sep 10 00:59 sbin
drwxr-xr-x   2 root root 4096 Sep  8 07:00 srv
dr-xr-xr-x  12 root root    0 Sep 25 04:06 sys
drwxrwxrwt   1 root root 4096 Sep 10 07:05 tmp
drwxr-xr-x   1 root root 4096 Sep  8 07:00 usr
drwxr-xr-x   1 root root 4096 Sep  8 07:00 var
Removing intermediate container a7e9b8e68b2e
 ---> f5f070657ceb
Step 8/15 : COPY mule-ee-distribution-standalone-4.3.0.zip /mulezip
 ---> d671e3fc82bf
Step 9/15 : RUN cd /mulezip && ls -la
 ---> Running in e07fab906ce4
total 313064
drwxr-xr-x 1 root root      4096 Sep 25 04:06 .
drwxr-xr-x 1 root root      4096 Sep 25 04:06 ..
-rw-r--r-- 1 root root 320568903 Sep 24 18:04 mule-ee-distribution-standalone-4.3.0.zip
Removing intermediate container e07fab906ce4
 ---> c0685864471f
Step 10/15 : RUN cd ../opt && unzip /mulezip/mule-ee-distribution-standalone-4.3.0.zip && ls -la
 ---> Running in a9c953fac022
Archive:  /mulezip/mule-ee-distribution-standalone-4.3.0.zip
   creating: mule-enterprise-standalone-4.3.0/
   creating: mule-enterprise-standalone-4.3.0/lib/
   creating: mule-enterprise-standalone-4.3.0/lib/patches/
   creating: mule-enterprise-standalone-4.3.0/conf/
   creating: mule-enterprise-standalone-4.3.0/bin/
   creating: mule-enterprise-standalone-4.3.0/lib/boot/
   creating: mule-enterprise-standalone-4.3.0/lib/boot/exec/
   creating: mule-enterprise-standalone-4.3.0/server-plugins/
   creating: mule-enterprise-standalone-4.3.0/logs/
   creating: mule-enterprise-standalone-4.3.0/lib/user/
   creating: mule-enterprise-standalone-4.3.0/apps/
   creating: mule-enterprise-standalone-4.3.0/domains/
   creating: mule-enterprise-standalone-4.3.0/domains/default/
   creating: mule-enterprise-standalone-4.3.0/policies/
   creating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/
   creating: mule-enterprise-standalone-4.3.0/tools/
   creating: mule-enterprise-standalone-4.3.0/lib/mule/
   creating: mule-enterprise-standalone-4.3.0/services/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/lib/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/META-INF/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/META-INF/maven/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/META-INF/maven/org.mule.services/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/META-INF/maven/org.mule.services/mule-service-scheduler/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/provider/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/config/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/threads/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/executor/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/logging/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/reporting/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/META-INF/mule-artifact/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/META-INF/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/META-INF/maven/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/META-INF/maven/org.mule.services/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/META-INF/maven/org.mule.services/mule-service-soap/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/client/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/provider/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/attachment/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/util/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/xml/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/xml/stax/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/xml/util/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/config/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/callback/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/conduit/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/message/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/META-INF/mule-artifact/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/META-INF/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/META-INF/maven/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/META-INF/maven/com.mulesoft.mule.services/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/META-INF/maven/com.mulesoft.mule.services/mule-service-http-ee/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/META-INF/mule-artifact/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/server/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/builder/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/reconnect/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/provider/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/lib/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/META-INF/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/META-INF/maven/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/META-INF/maven/com.mulesoft.mule.services/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/META-INF/maven/com.mulesoft.mule.services/mule-service-oauth-ee/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/platform/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/META-INF/mule-artifact/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/META-INF/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/META-INF/mule-artifact/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/META-INF/maven/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/META-INF/maven/com.mulesoft.services/
   creating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/META-INF/maven/com.mulesoft.services/mule-service-weave-ee/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/META-INF/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/META-INF/maven/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/META-INF/maven/com.mulesoft.anypoint/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/META-INF/maven/com.mulesoft.anypoint/api-gateway-contract-service/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/META-INF/mule-artifact/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/com/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/com/mulesoft/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/com/mulesoft/mule/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/com/mulesoft/mule/gateway/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/com/mulesoft/mule/gateway/service/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/META-INF/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/META-INF/maven/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/META-INF/maven/com.mulesoft.anypoint/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/META-INF/maven/com.mulesoft.anypoint/api-gateway-events-collector-service/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/META-INF/mule-artifact/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/com/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/com/mulesoft/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/com/mulesoft/mule/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/com/mulesoft/mule/gateway/
   creating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/com/mulesoft/mule/gateway/service/
   creating: mule-enterprise-standalone-4.3.0/lib/launcher/
   creating: mule-enterprise-standalone-4.3.0/lib/opt/
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/lib/mchange-commons-java-0.2.15.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/lib/commons-lang3-3.8.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/lib/checker-qual-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/threads/DedicatedSchedulerThreadPools.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/threads/SchedulerThreadPools$Builder.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/threads/SchedulerThreadPools$CustomScheduler.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/executor/AbstractByCallerPolicy.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/executor/SchedulerTaskThrottledException.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/executor/ByCallerThreadGroupPolicy.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/executor/ByCallerThrottlingPolicy.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/logging/SuppressingLogger.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/QuartzScheduledFututre.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/reporting/DefaultSchedulerView.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/AbstractRunnableFutureDecorator.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/RepeatableTaskWrapper.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/ScheduledFutureDecorator.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/NullScheduledFuture.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/RunnableFutureDecorator.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/lib/c3p0-0.9.5.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/lib/caffeine-2.8.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/lib/error_prone_annotations-2.3.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/META-INF/maven/org.mule.services/mule-service-scheduler/pom.xml  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/ThreadType.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/provider/SchedulerServiceProvider.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/DefaultScheduler.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/config/ContainerThreadPoolsConfig.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/threads/SchedulerThreadFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/threads/SchedulerThreadPools$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/threads/SchedulerThreadPools.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/threads/UberSchedulerThreadPools.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/executor/ByCallerThreadGroupPolicy$AbortBusyPolicy.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/executor/WaitPolicy.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/RunnableRepeatableFutureDecorator.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/QuartzCronJob.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/DefaultSchedulerService$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/ThrottledScheduler.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/org/mule/service/scheduler/internal/DefaultSchedulerService.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/META-INF/mule-artifact/mule-artifact.json  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/lib/HikariCP-java7-2.4.13.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-scheduler-1.3.0/lib/quartz-2.3.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/jasypt-1.9.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-rt-bindings-soap-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-xmlsec-api-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/jaxb-api-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/java-support-7.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cryptacular-1.2.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/kotlin-stdlib-1.1.3-2.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/wss4j-ws-security-stax-2.2.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-saml-impl-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/stax-api-1.0-2.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/commons-codec-1.13.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-rt-frontend-simple-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/stax2-api-4.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-xacml-api-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-xacml-impl-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/OutputSoapHeadersInterceptor.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/provider/SoapServiceProvider.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/attachment/Base64Encoder.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/attachment/MtomResponseEnricher.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/attachment/AttachmentResponseEnricher.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/attachment/Base64Decoder.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/attachment/SoapAttachmentRequestEnricher.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/SoapRequestGenerator.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/SoapResponseGenerator.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/util/SoapServiceMetadataTypeUtils.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/xml/stax/StaxSource$PseudoReader.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/xml/stax/XMLStreamReaderToContentHandler$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/xml/stax/XMLStreamReaderToContentHandler.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/config/WssStoreConfigurationPropertiesBuilder.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/config/WssKeyStoreConfigurationPropertiesBuilder.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/WssUsernameTokenSecurityStrategyCxfAdapter.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/WssDecryptSecurityStrategyCxfAdapter.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/callback/WSPasswordCallbackHandler.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/callback/CompositeCallbackHandler.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/SecurityStrategyCxfAdapter.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/WssTimestampSecurityStrategyCxfAdapter.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/conduit/SoapServiceConduitInitiator.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/message/EmptySoapResponse.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/OutputBodyMetadataResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/ServiceOperationsResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/NodeMetadataResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/HeadersMetadataResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/OutputHeadersMetadataResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/DefaultSoapMetadataResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/InputHeadersMetadataResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/InputAttachmentsMetadataResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-rt-ws-security-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/Saxon-HE-9.9.1-1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/metrics-core-3.1.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/wss4j-bindings-2.2.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-core-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/activation-1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/spring-context-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/commons-lang3-3.8.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/checker-qual-2.0.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/geronimo-javamail_1.4_mail-1.8.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/neethi-3.1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/annotations-13.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/dom4j-2.1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-security-impl-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-xmlsec-impl-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-rt-wsdl-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/istack-commons-runtime-3.0.8.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/wss4j-ws-security-policy-stax-2.2.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/spring-expression-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/asm-7.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-xacml-saml-api-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/spring-aop-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/mimepull-1.9.7.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/stax-ex-1.7.8.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/wss4j-ws-security-common-2.2.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/wsdl4j-1.6.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/error_prone_annotations-2.1.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-rt-ws-addr-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/saaj-impl-1.3.28.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/joda-time-2.9.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/stax-utils-20080702.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-rt-security-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/spring-beans-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-saml-api-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-rt-management-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/commons-io-2.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-rt-ws-policy-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/spring-jcl-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/jaxws-api-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/jsr305-3.0.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/xmlschema-core-2.2.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/j2objc-annotations-1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-soap-api-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-security-api-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/jakarta.xml.bind-api-2.3.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-rt-databinding-jaxb-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/ant-1.10.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/META-INF/mule-artifact/mule-artifact.json  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/animal-sniffer-annotations-1.14.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/bcprov-jdk15on-1.64.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/woodstox-core-5.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-core-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/mule-wsdl-parser-1.1.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/jakarta.activation-api-1.2.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/slf4j-api-1.7.30.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-rt-security-saml-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/javax.xml.soap-api-1.4.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/jaxb-runtime-2.3.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/ant-launcher-1.10.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/wss4j-ws-security-dom-2.2.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/FastInfoset-1.2.16.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/txw2-2.3.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/cxf-rt-ws-rm-3.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-xacml-saml-impl-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/wss4j-policy-2.2.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/opensaml-profile-api-3.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/spring-core-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/xmlsec-2.1.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/lib/guava-25.1-jre.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/META-INF/maven/org.mule.services/mule-service-soap/pom.xml  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/SoapServiceImplementation.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/client/CxfClientProvider$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/client/CxfClientFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/client/CxfClientFactory$ProxyService.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/client/CxfClientProvider.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/client/SoapCxfClientFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/client/CxfClientFactory$DefaultServiceConfiguration.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/client/CxfAttachmentsFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/client/SoapCxfClientFactory$ResourceLocatorAdapter.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/client/SoapCxfClient.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/DispatchingRequestFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/NamespaceRestorerStaxInterceptor.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/StreamClosingInterceptor.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/OutputMtomSoapAttachmentsInterceptor.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/NamespaceSaverStaxInterceptor.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/ScopeSaverXMLStreamReader.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/NamespaceRestorerXMLStreamReader.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/SoapActionInterceptor.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/MessageDispatcherInterceptor.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/interceptor/StreamClosingInterceptor$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/attachment/SoapAttachmentResponseEnricher.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/attachment/AttachmentRequestEnricher.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/attachment/MtomRequestEnricher.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/generator/EmptyRequestGenerator.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/util/XmlTransformationException.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/util/XmlTransformationUtils.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/xml/stax/StaxSource$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/xml/stax/StaxSource.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/xml/stax/DelegateXMLStreamReader.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/xml/util/XMLUtils.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/config/WssTrustStoreConfigurationPropertiesBuilder.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/WssEncryptSecurityStrategyCxfAdapter.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/WssSignSecurityStrategyCxfAdapter.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/SecurityStrategyType.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/security/WssVerifySignatureSecurityStrategyCxfAdapter.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/conduit/SoapServiceConduit.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/message/ImmutableSoapResponse.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/InputBodyMetadataResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/AttachmentsMetadataResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/BodyMetadataResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/ImmutableSoapOperationMetadata.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-soap-1.3.0/org/mule/service/soap/metadata/OutputAttachmentsMetadataResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/jsr305-3.0.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/commons-text-1.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/META-INF/maven/com.mulesoft.mule.services/mule-service-http-ee/pom.xml  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/META-INF/mule-artifact/mule-artifact.json  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/server/EEGrizzlyServerManager.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/server/EEHttpListenerConnectionManager.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/server/EEGrizzlyHttpServer.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/EEHttpServiceImplementation.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/HostNameResolver.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/HostNameResolver$AddressesRingFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/HostNameIpsRing.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/HostNameResolver$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/GrizzlyWebSocketBroadcaster$BinaryFrameFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/GrizzlyWebSocketBroadcaster$TextFrameFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/GrizzlyWebSocketBroadcaster$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/PipedFragmentHandler.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/FragmentHandlerProvider.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/FragmentHandler.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/GrizzlyWebSocketBroadcaster$BroadcastAction.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/EEHttpClientConnectionManager.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/builder/NameResolvingRequestBuilder$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/builder/NameResolvingRequestBuilder$IpListFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/builder/NoNameResolvingRequestHandler.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/builder/ProxyNameResolvingRequestBuilder.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/OutboundWebSocketListener.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/OutboundWebSocket$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/reconnect/OutboundWebSocketReconnectionHandler.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/OutboundWebSocket$2.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/GrizzlyInboundWebSocketRequest.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/DefaultWebSocketMessage.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/mailapi-1.6.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/error_prone_annotations-2.3.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/grizzly-websockets-2.3.36-MULE-018.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/connection-pool-2.3.36-MULE-018.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/mule-service-http-1.5.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/builder/NameResolvingRequestBuilder.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/builder/NameResolvingRequestBuilder$RotateIpListFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/InboundWebSocket$2.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/InboundWebSocket$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/WebSocketHandlerRegistry.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/OutboundWebSocket.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/grizzly-http-server-2.3.36-MULE-018.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/jakarta.activation-1.2.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/WebSocketUtils.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/PipedFragmentHandlerProvider.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/GrizzlyWebSocketBroadcaster$FrameFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/DataFrameEmitter.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/ManagedPipedInputStream.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/ws/GrizzlyWebSocketBroadcaster.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/EEGrizzlyHttpClient.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/builder/NameResolvingRequestBuilder$NonRotateIpListFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/builder/DirectNameResolvingRequestBuilder.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/GrizzlyWebSocketHandlerManager.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/service/client/ws/InboundWebSocket.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/com/mulesoft/service/http/impl/provider/EEHttpServiceProvider.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/guava-25.1-jre.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/commons-lang3-3.8.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/javax.activation-1.2.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/j2objc-annotations-1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/animal-sniffer-annotations-1.14.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/slf4j-api-1.7.30.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/geronimo-servlet_3.0_spec-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/commons-io-2.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/checker-qual-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/caffeine-2.8.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/grizzly-http-servlet-2.3.36-MULE-018.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/grizzly-framework-2.3.36-MULE-018.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/grizzly-http-client-1.14-MULE-017.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-http-ee-1.6.0/lib/grizzly-http-2.3.36-MULE-018.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/lib/commons-lang3-3.8.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/lib/checker-qual-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/lib/error_prone_annotations-2.3.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/platform/DefaultOAuthPlatformManagedDancerBuilder.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/platform/OCSSettings.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/platform/ImmutablePlatformManagedConnectionDescriptor.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/platform/OCSClient$1.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/platform/DefaultPlatformManagedConnectionDescriptor.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/platform/OCSClient.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/platform/DefaultPlatformManagedDancer.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/platform/OCSClient$OCSClientFactory.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/EEOAuthService.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/META-INF/mule-artifact/mule-artifact.json  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/lib/caffeine-2.8.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/lib/mule-service-oauth-2.0.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/META-INF/maven/com.mulesoft.mule.services/mule-service-oauth-ee/pom.xml  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/com/mulesoft/service/oauth/internal/EEOAuthServiceProvider.class  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-oauth-ee-1.0.0/lib/commons-codec-1.13.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/META-INF/MANIFEST.MF  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/mule-service-weave-ee-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/mule-service-weave-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/flatfile-module-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/excel-module-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/runtime-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/wlang-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/avro-module-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/dwb-module-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/java-module-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/core-modules-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/yaml-module-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/ndjson-module-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/edi-parser-2.3.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/core-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/xlsx-streamer-2.1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/poi-ooxml-4.1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/poi-4.1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/debugger-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/caffeine-2.8.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/parser-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/syaml_2.12-0.7.260.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/ltm-datamodel-2.3.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/spire_2.12-0.14.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/spire-macros_2.12-0.14.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/machinist_2.12-0.6.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/algebra_2.12-0.7.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/cats-kernel_2.12-0.9.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/scala-parser-combinators_2.12-1.1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/log4j-api-scala_2.12-11.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/scala-reflect-2.12.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/scala-common_2.12-0.5.60.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/parboiled_2.12-2.1.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/shapeless_2.12-2.3.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/macro-compat_2.12-1.1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/scala-library-2.12.10.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/woodstox-core-5.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/aalto-xml-1.0.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/commons-lang3-3.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/jakarta.mail-1.6.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/avro-1.10.0-MULE_4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/log4j-core-2.11.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/log4j-api-2.11.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/commons-codec-1.13.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/commons-collections4-4.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/commons-math3-3.6.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/poi-ooxml-schemas-4.1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/commons-compress-1.19.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/curvesapi-1.06.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/xml-apis-1.4.01.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/slf4j-api-1.7.25.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/checker-qual-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/error_prone_annotations-2.3.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/stax2-api-4.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/jakarta.activation-1.2.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/jackson-databind-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/jackson-core-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/xmlbeans-3.1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/lib/jackson-annotations-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/META-INF/mule-artifact/mule-artifact.json  
  inflating: mule-enterprise-standalone-4.3.0/services/mule-service-weave-ee-2.3.0/META-INF/maven/com.mulesoft.services/mule-service-weave-ee/pom.xml  
  inflating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/META-INF/maven/com.mulesoft.anypoint/api-gateway-contract-service/pom.xml  
  inflating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/META-INF/mule-artifact/mule-artifact.json  
  inflating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/com/mulesoft/mule/gateway/service/ContractServiceImplementation.class  
  inflating: mule-enterprise-standalone-4.3.0/services/api-gateway-contract-service-1.1.0/com/mulesoft/mule/gateway/service/ContractServiceProvider.class  
  inflating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/META-INF/maven/com.mulesoft.anypoint/api-gateway-events-collector-service/pom.xml  
  inflating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/META-INF/mule-artifact/mule-artifact.json  
  inflating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/com/mulesoft/mule/gateway/service/DefaultEventsCollectorService.class  
  inflating: mule-enterprise-standalone-4.3.0/services/api-gateway-events-collector-service-1.1.0/com/mulesoft/mule/gateway/service/EventsCollectorProvider.class  
  inflating: mule-enterprise-standalone-4.3.0/LICENSE.txt  
  inflating: mule-enterprise-standalone-4.3.0/conf/log4j2.xml  
  inflating: mule-enterprise-standalone-4.3.0/bin/launcher.conf  
  inflating: mule-enterprise-standalone-4.3.0/bin/launcher.bat  
  inflating: mule-enterprise-standalone-4.3.0/bin/mule.bat  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-solaris-x86-32.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-solaris-sparc-32.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-aix-ppc-64.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-linux-armhf-32  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-freebsd-x86-32  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-aix-ppc-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-aix-ppc-32  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-windows-ia-64.exe  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/SE-12551-1.1.0-1.1.15-2.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/SE-12551-1.2.0-1.3.0-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.1.12-1.2.0-1.2.2-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.1.4-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.1.7-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.1.1-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/tools/install_tools.bat  
  inflating: mule-enterprise-standalone-4.3.0/tools/agent-setup-2.4.6-amc-final.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javax.activation-api-1.2.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/txw2-2.3.1-MULE-001.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/istack-commons-runtime-3.0.7.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javax.transaction-api-1.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/org.everit.json.schema-1.5.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/json-20160810.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/commons-beanutils-1.9.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/uuid-3.4.2-MULE-001.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javax.annotation-api-1.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/commons-pool-1.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/geronimo-j2ee-connector_1.5_spec-2.0.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jgrapht-core-1.3.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/snakeyaml-1.26.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/failsafe-2.1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/vibur-object-pool-23.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/disruptor-1.2.10.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/aspectjrt-1.9.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/plexus-utils-3.0.24.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/maven-builder-support-3.3.9.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/plexus-interpolation-1.21.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/plexus-sec-dispatcher-1.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/maven-model-builder-3.3.9.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jcommander-1.69.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/org.eclipse.sisu.plexus-0.3.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/raml-parser-2-1.0.49.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/libphonenumber-8.0.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/joda-time-2.9.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/spring-beans-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jaxb-core-2.3.0.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/spring-context-support-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/ehcache-core-2.5.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/fluent-hc-4.3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/c3p0-0.9.5.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javax.ws.rs-api-2.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/hk2-api-2.3.0-b05.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/hk2-utils-2.3.0-b05.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/hk2-locator-2.3.0-b05.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/handlebars-4.0.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/antlr4-runtime-4.5.1-1.jar  
  inflating: mule-enterprise-standalone-4.3.0/conf/tls-fips140-2.conf  
  inflating: mule-enterprise-standalone-4.3.0/conf/extra-bootstrap-modules.xml  
  inflating: mule-enterprise-standalone-4.3.0/bin/launcher  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-linux-armhf-32.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-linux-ia-64.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-macosx-universal-32.jnilib  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-solaris-x86-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-linux-ppcbe-32  
  inflating: mule-enterprise-standalone-4.3.0/README.txt  
  inflating: mule-enterprise-standalone-4.3.0/logs/README.txt  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/README.txt  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.3.0-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2613-1.2.2-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/bin/amc_setup  
  inflating: mule-enterprise-standalone-4.3.0/bin/amc_debug  
  inflating: mule-enterprise-standalone-4.3.0/bin/amc_setup.bat  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/slf4j-api-1.7.30.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/commons-cli-1.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/licm-2.1.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/truelicense-1.29.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/truexml-1.29.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/propertyset-1.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/oscore-2.2.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/wrapper-3.5.37.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/disruptor-3.3.7.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/slf4j-ext-1.7.30.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/log4j-api-2.13.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/log4j-slf4j-impl-2.13.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/log4j-1.2-api-2.13.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/jcl-over-slf4j-1.7.30.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/jul-to-slf4j-1.7.30.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/jackson-annotations-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/jackson-core-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/jackson-databind-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-metadata-model-json-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-artifact-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-logging-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-deployment-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-container-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-deployment-model-impl-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-artifact-ast-0.8.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-service-oauth-api-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-extensions-xml-support-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-spring-config-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/commons-io-2.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jsr305-3.0.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/checker-qual-2.0.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/xmlbeans-3.1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javax.jms-api-2.0.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/aether-api-1.0.2.v20150114.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/mule-maven-client-api-1.5.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/maven-model-3.3.9.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/mule-maven-client-impl-1.5.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/maven-settings-builder-3.3.9.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/plexus-component-annotations-1.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/maven-settings-3.3.9.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/plexus-cipher-1.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/maven-aether-provider-3.3.9.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/maven-artifact-3.3.9.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/maven-repository-metadata-3.3.9.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/aether-impl-1.0.2.v20150114.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/antlr-runtime-3.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/yagi-1.0.49.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/annotations-3.0.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/validation-api-1.1.0.Final.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jackson-coreutils-1.9.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/msg-simple-1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/btf-1.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/uri-template-0.9.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jopt-simple-5.0.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/xmlschema-core-2.2.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jakarta.activation-1.2.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/mule-classloader-model-3.4.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/spring-context-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javax.xml.soap-api-1.4.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javax.jws-api-1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jaxb-impl-2.3.1-MULE-001.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/mule-encryption-1.2.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/bcpg-jdk15on-1.61.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/bcpkix-jdk15on-1.61.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jersey-guava-2.11.jar  
  inflating: mule-enterprise-standalone-4.3.0/conf/scheduler-pools.conf  
  inflating: mule-enterprise-standalone-4.3.0/MIGRATION.txt  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/wrapper-windows-x86-64.dll  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-linux-x86-64.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-freebsd-x86-64.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-linux-ppcbe-32.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-aix-ppc-32.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-hpux-ia-64.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-macosx-universal-32  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-solaris-sparc-32  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-linux-armel-32  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.1.3-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.1.5-1.1.6-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2613-1.3.9-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javax.activation-1.2.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/semver4j-3.1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/reactive-streams-1.0.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jaxb-runtime-2.3.1-MULE-001.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/reflections-0.9.10.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/reactor-extra-3.2.3.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/cglib-nodep-3.2.10.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/aether-util-1.0.2.v20150114.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/config-1.3.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/httpclient-4.5.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jackson-module-jsonSchema-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/json-schema-validator-2.2.10.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javax.json-api-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javax.json-1.0.4.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jakarta.mail-1.6.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/spring-core-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/mule-btm-2.1.12.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/commons-dbutils-1.7.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/bcprov-jdk15on-1.61.jar  
  inflating: mule-enterprise-standalone-4.3.0/conf/tls-default.conf  
  inflating: mule-enterprise-standalone-4.3.0/conf/wrapper-license.conf  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-linux-390-32.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-linux-x86-32.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-linux-390-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-windows-x86-64.exe  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-hpux-parisc-32  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-solaris-sparc-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2576-1.3.7-1.3.8-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/SE-12551-1.3.1-1.3.4-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2613-1.2.3-1.2.4-1.3.0-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-mvel2-2.1.9-MULE-020.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-extensions-soap-support-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-extensions-soap-api-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-service-soap-api-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-tls-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-javaee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-tooling-support-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-repository-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-batch-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-http-policy-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-license-impl-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-plugin-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-dwb-api-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/dwb-api-2.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/api-gateway-api-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-autodiscovery-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-api-deployment-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-analytics-gw-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/api-annotations-1.2.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javax.inject-1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/guava-25.1-jre.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/commons-math3-3.6.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/spring-aop-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/spring-jcl-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/spring-expression-5.1.6.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jsoup-1.11.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jaxws-api-2.3.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/dom4j-2.1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/objenesis-2.5.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/kryo-shaded-4.0.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/hazelcast-client-3.12.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jersey-common-2.11.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/mapdb-1.0.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jackson-dataformat-yaml-2.10.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/conf/mule.pub  
  inflating: mule-enterprise-standalone-4.3.0/conf/wrapper.conf  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-solaris-sparc-64.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-linux-armel-32.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-linux-ppcle-64.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-hpux-parisc-32.sl  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-windows-x86-32.exe  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-linux-ppcbe-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-hpux-parisc-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.1.8-1.1.10-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.1.13-1.1.14-1.2.3-1.2.4-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2613-1.2.0-1.2.1-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/tools/install_tools  
  inflating: mule-enterprise-standalone-4.3.0/tools/support-tools-installer-1.0.0-final.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/commons-codec-1.13.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/log4j-core-2.13.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-metadata-model-api-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-message-metadata-model-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-artifact-declaration-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-dsl-api-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-extensions-api-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-extensions-api-dsql-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-extensions-api-persistence-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-metadata-model-persistence-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-metadata-model-catalog-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-metadata-model-raml-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-service-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-artifact-ast-dependency-graph-0.8.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-extensions-spring-support-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-spring-config-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-xa-tx-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-cache-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-kryo-serializer-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-bti-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-cluster-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-hdp-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-policies-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/launcher/groovy-all-2.4.15-indy.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/mchange-commons-java-0.2.15.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/osgi-resource-locator-1.0.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/aspectjweaver-1.9.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/conf/.lic-mule  
  inflating: mule-enterprise-standalone-4.3.0/bin/mule  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-solaris-x86-64.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/wrapper-windows-ia-64.dll  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-macosx-universal-64.jnilib  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-freebsd-x86-32.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-linux-390-32  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-linux-ppcle-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-freebsd-x86-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-macosx-universal-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/SE-12562-1.0.0-1.5.5-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.3.5-1.3.9-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.1.15-1.1.16-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.1.11-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/SE-12551-1.0.0-1.0.1-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2613-1.3.7-1.3.8-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jaxb-api-2.3.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/FastInfoset-1.2.15.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/commons-collections-3.2.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/commons-pool2-2.6.2.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/fastutil-8.1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/conf/http-server-sockets.conf  
  inflating: mule-enterprise-standalone-4.3.0/bin/additional.groovy  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-linux-ppcbe-64.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/wrapper-windows-x86-32.dll  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-hpux-ia-32.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-hpux-ia-32  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-linux-x86-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-linux-ia-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.1.2-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.2.5-1.3.1-1.3.4-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2612-1.0.0-1.0.2-1.1.0-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2613-1.2.5-1.3.1-1.3.4-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/mule-module-boot-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-core-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-core-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-tracking-ee-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/api-gateway-contract-service-api-1.2.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/api-gateway-events-collector-service-api-1.0.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/api-gateway-core-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/api-gateway-client-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/commons-lang3-3.8.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/stax-ex-1.8.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/xerces2-xsd11-2.11.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/aether-connector-basic-1.0.2.v20150114.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/aether-spi-1.0.2.v20150114.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/aether-transport-file-1.0.2.v20150114.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/aether-transport-http-1.0.2.v20150114.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/httpcore-4.4.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/stringtemplate-3.2.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/commons-lang-2.6.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/json-schema-core-1.2.10.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/juniversalchardet-1.0.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/rhino-1.7.12.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/javassist-3.7.ga.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/minlog-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/kryo-serializers-0.45.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/hazelcast-3.12.jar  
  inflating: mule-enterprise-standalone-4.3.0/conf/licenseKeyStore  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-linux-390-64.so  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/libwrapper-hpux-parisc-64.sl  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-solaris-x86-32  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-linux-x86-32  
  inflating: mule-enterprise-standalone-4.3.0/lib/boot/exec/wrapper-hpux-ia-64  
  inflating: mule-enterprise-standalone-4.3.0/lib/patches/mule-artifact-patches/APIKIT-2613-1.3.5-1.3.6-1.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-api-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-metadata-model-java-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-http-policy-api-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-policy-api-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-metadata-model-xml-1.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-service-http-api-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-launcher-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-deployment-model-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-license-api-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-global-config-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/mule/mule-module-extensions-support-4.3.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/gson-2.8.5.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/error_prone_annotations-2.1.3.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/j2objc-annotations-1.1.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/animal-sniffer-annotations-1.14.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/caffeine-2.8.0.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/jheaps-0.10.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/reactor-core-3.2.12.RELEASE.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/byte-buddy-1.10.7.jar  
  inflating: mule-enterprise-standalone-4.3.0/lib/opt/bcprov-ext-jdk15on-1.61.jar  
total 12
drwxr-xr-x  1 root root 4096 Sep 25 04:06 .
drwxr-xr-x  1 root root 4096 Sep 25 04:06 ..
drwxrwxr-x 12 root root 4096 Apr 25 00:15 mule-enterprise-standalone-4.3.0
Removing intermediate container a9c953fac022
 ---> 57f300e6b7e6
Step 11/15 : RUN ln -s /opt/mule-ee-distribution-standalone-4.3.0 ${MULE_HOME}
 ---> Running in 11e0cc284a51
Removing intermediate container 11e0cc284a51
 ---> cde545a10e76
Step 12/15 : RUN chmod 777 $MULE_HOME/bin/mule
 ---> Running in 448b3fc422f8

chmod: cannot access '/opt/mule/bin/mule': No such file or directory 
```

Note: Made a mistake on my Dockerfile, the name after extract the .zip download from mule-ee-* the folder name is mule-enterprise-standalone-4.3.0.
But after running the command to build the image docker build . -t mule_standalone_4_3_0_docker_ubuntu_19_04 my image.
All the previous steps were cached and only the step that failed is executed again, as it can be below.

```
 ~/devo/devops-swissarmyknife/d/mule-standalone │ master +3 !3  docker build . -t mule_standalone_4_3_0_docker_ubuntu_19_04
Sending build context to Docker daemon  320.6MB
Step 1/15 : FROM ubuntu:19.04
 ---> c88ac1f841b7
Step 2/15 : FROM openjdk:8
 ---> db530b5a3ccf
Step 3/15 : ENV BUILD_DATE=09252020
 ---> Using cache
 ---> bade8fa218df
Step 4/15 : ENV MULE_HOME=/opt/mule
 ---> Using cache
 ---> 16c804de272d
Step 5/15 : ENV MULE_VERSION=4.3.0
 ---> Using cache
 ---> d03300732599
Step 6/15 : RUN mkdir mulezip
 ---> Using cache
 ---> 1835c28a0e27
Step 7/15 : RUN ls -la
 ---> Using cache
 ---> f5f070657ceb
Step 8/15 : COPY mule-ee-distribution-standalone-4.3.0.zip /mulezip
 ---> Using cache
 ---> d671e3fc82bf
Step 9/15 : RUN cd /mulezip && ls -la
 ---> Using cache
 ---> c0685864471f
Step 10/15 : RUN cd ../opt && unzip /mulezip/mule-ee-distribution-standalone-4.3.0.zip && ls -la
 ---> Using cache
 ---> 57f300e6b7e6
Step 11/15 : RUN ln -s /opt/mule-enterprise-standalone-4.3.0 ${MULE_HOME}
 ---> Running in ade64d622f14
Removing intermediate container ade64d622f14
 ---> a010c29c4b3b
Step 12/15 : RUN chmod 777 $MULE_HOME/bin/mule
 ---> Running in 0292e7f100e5
Removing intermediate container 0292e7f100e5
 ---> 336b94034873
Step 13/15 : RUN chmod 777 $MULE_HOME/bin/launcher
 ---> Running in 75df58b40552
Removing intermediate container 75df58b40552
 ---> e242c48b7a26
Step 14/15 : CMD ["/opt/mule/bin/mule"]
 ---> Running in 6f895d6cd7d7
Removing intermediate container 6f895d6cd7d7
 ---> 0b8ebbda6742
Step 15/15 : EXPOSE 9082
 ---> Running in f4a73d1bbb09
Removing intermediate container f4a73d1bbb09
 ---> c7afe0c44e40
Successfully built c7afe0c44e40
Successfully tagged mule_standalone_4_3_0_docker_ubuntu_19_04:latest
```

Execute the following command to run the application by Mule runtime environment:
```
docker run -it --rm -p 9082:9082 my_image_name_tag
```

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