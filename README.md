# HorizontalPodAutoscaler Walkthrough

This example is based on horizontal pod autoscale example. https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/

Compared to the original example, this one is based on golang and it is using an unprivileged port 1025 to be compliant with pod security policies.

## Install The Example Application

With the following command, the sample application will be installed.

    ❯ kubectl apply -f webserver.yaml

To start the load test use:

    ❯ kubectl run -it --rm load-generator --image=busybox /bin/sh --generator=run-pod/v1
    while true; do wget -q -O- http://webserver-service; done

The scheduler will scale up, until the cpu usage is below the defined 20%.

    ❯ kubectl get hpa
    NAME         REFERENCE               TARGETS   MINPODS   MAXPODS   REPLICAS   AGE
    webserver    Deployment/php-apache   19%/20%   1         100       7          17m
