
Solution


Some stuff I already had setup on my laptop:
minikube, docker, kubectl, k9s, helm.


setup nginx ingress

got web app locally and ran it.

Then loaded it into minikube image

made helm charts for all svcs of keycloak pgadmin postgres and webapp as given in readme.



To run:

$ cd helm-chart/

$ helm template tributech ./ -f values.yaml --debug


