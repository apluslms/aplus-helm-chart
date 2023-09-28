# aplus-helm-chart
Helm chart for deploying the core components of the A+ learning management system - [A+](https://github.com/apluslms/a-plus/), [mooc-grader](https://github.com/apluslms/mooc-grader/) and [gitmanager](https://github.com/apluslms/a-plus/) - to a Kubernetes cluster.

## Installing the chart

For local testing with e.g. [minikube](https://minikube.sigs.k8s.io/docs/start/), you can run with the following:

- Start minikube and enable the ingress addon, if not already enabled:
  - `minikube start; minikube addons enable ingress`
- Add the used hostnames to your /etc/hosts file or such, so that they resolve correctly:
  - `echo "$(minikube ip)\taplus.local grader.local gitmanager.local" | sudo tee -a /etc/hosts`
- Clone the repository
- Run `helm install -n aplus --create-namespace -f values-minikube-testing.yaml aplus .` to install the chart
- Once all the pods are running, perform initial database migrations for A+ and gitmanager
  - `kubectl exec -n aplus -it $(kubectl get po -n aplus -l app=aplus -o name) -c aplus -- python3 manage.py migrate`
  - `kubectl exec -n aplus -it $(kubectl get po -n aplus -l app=gitmanager -o name) -c gitmanager -- python3 manage.py migrate`

After these steps, browsing to `http://aplus.local` takes you to the front page of A+ (with no installed courses, though).
