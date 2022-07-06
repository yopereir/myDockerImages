#!/bin/bash
# after having minikube installed, simply run `./run-kube.sh -fm`
mysqlVersion=5.7
shouldNotUpdate="false"
localDbUser="root"
localDbPassword=""
localDbName=""
env="dev"
localDbHost="%"
DB_NAME=""
DB_PASSWORD=""
DB_USER=""
freshMinikube=false
freshNamespace=false
freshSecrets=false
freshDashboard=false
while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "$package - attempt to capture frames"
      echo " "
      echo "$package [options] application [arguments]"
      echo " "
      echo "options:"
      echo "-h, --help                 show this help message"
      echo "-fm,                       bool to know if fresh instance of minikube should be used"
      echo "-fn,                       bool to know if fresh instance of namespace should be used"
      echo "-fs,                       bool to know if fresh instance of secrets should be used"
      echo "-fd,                       bool to know if fresh instance of dashboard should be used"
      echo "-fdn|-fnd,                 bool to know if fresh instance of namespace AND dashboard should be used"
      echo "-fds|-fsd,                 bool to know if fresh instance of secret AND dashboard should be used"
      exit 0
      ;;
    -fm)
      freshMinikube=true
      echo "Current minikube instance will be deleted and new instance will be created."
      freshDashboard=true
      echo "Current dashboard instance will be deleted and new instance will be created."
      shift
      ;;
    -fn)
      freshNamespace=true
      echo "Current namespace instance will be deleted and new instance will be created."
      shift
      ;;
    -fs)
      freshSecrets=true
      echo "Current secrets instance will be deleted and new instance will be created."
      shift
      ;;
    -fd)
      freshDashboard=true
      echo "Current dashboard instance will be deleted and new instance will be created."
      shift
      ;;
    -fdn|-fnd)
      freshDashboard=true
      echo "Current dashboard instance will be deleted and new instance will be created."
      freshNamespace=true
      echo "Current namespace instance will be deleted and new instance will be created."
      shift
      ;;
    -fds|-fsd)
      freshDashboard=true
      echo "Current dashboard instance will be deleted and new instance will be created."
      freshSecrets=true
      echo "Current secrets instance will be deleted and new instance will be created."
      shift
      ;;
    *)
      break
      ;;
  esac
done
stackname='wordpress-test'
arr=['configs','secrets','volumes']
hash=$(git rev-parse --short HEAD)

# Start minikube
if [ $freshMinikube = true ]; then 
minikube delete --all --purge
fi
echo "Checking if minikube is running."
if [ "$(minikube status -f {{.Host}})" != 'Running' ]; then
echo "minikube is not running.  Starting minikube."
minikube start --feature-gates="IPv6DualStack=false" --cpus 8 --memory 8192  --addons=ingress,ingress-dns --driver=hyperkit --nfs-share ${PWD%$(echo ${PWD##*/})*}
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
eval $(minikube docker-env)
fi

# Minikube dashboard
processIds=$(lsof -iTCP -sTCP:LISTEN -P | grep kubectl | cut -d ' ' -f4)
if [[ $processIds != '' && $freshDashboard == false ]];then
echo "Using existing dashboard";
else
for id in $processIds;do
kill $id
done
echo "Creating dashboard"
minikube dashboard &
fi

# Namespace
if [[ "$(kubectl get namespaces $stackname -o jsonpath="{.status.phase}")" == 'Active' && $freshNamespace == false ]];then
echo "Using existing namespace "$stackname
else
kubectl delete namespace $stackname
echo "Creating namespace "$stackname
kubectl create namespace $stackname
fi

# Config
kubectl delete configmap wordpress-webserver-conf --namespace=$stackname
kubectl create configmap wordpress-webserver-conf --from-file=./wordpress-repo/wp-config.php --namespace=$stackname

# Set dns resolution
if $(cat /etc/resolver/minikube | grep -q domain);then
 sudo sed -i -e "s/.*domain.*/$(echo "domain test")/" /etc/resolver/minikube;
 else 
 echo "domain test" | sudo tee -a /etc/resolver/minikube;
fi
if $(cat /etc/resolver/minikube | grep -q nameserver);then
 sudo sed -i -e "s/.*nameserver.*/$(echo "nameserver `minikube ip`")/" /etc/resolver/minikube;
 else 
 echo "nameserver `minikube ip`" | sudo tee -a /etc/resolver/minikube;
fi
if $(cat /etc/hosts | grep -q minikube);then
 sudo sed -i -e "s/.*minikube.*/$(echo "`minikube ip` minikube")/" /etc/hosts;
 else 
 echo "`minikube ip` minikube" | sudo tee -a /etc/hosts;
fi

# Deploy stack
export HOST_IP=$(ipconfig getifaddr en0) && envsubst < stack.yml | kubectl apply -f - --namespace=$stackname
sleep 3s
export HOST_IP=$(ipconfig getifaddr en0) && envsubst < stack.yml | kubectl apply -f - --namespace=$stackname
