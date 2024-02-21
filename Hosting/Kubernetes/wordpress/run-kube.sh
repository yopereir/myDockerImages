#!/bin/bash
# after having rancher installed and running, simply run `./run-kube.sh -fn`
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
ingress=false
freshNamespace=false
freshSecrets=false
while test $# -gt 0; do
  case "$1" in
    -h|--help)
      echo "$package - attempt to capture frames"
      echo " "
      echo "$package [options] application [arguments]"
      echo " "
      echo "options:"
      echo "-h, --help                 show this help message"
      echo "--no-update                skips updating local database with remote"
      echo "-e, --env=dev/loc          specify environment to use (dev/loc)"
      echo "-u, --user=STRING          username for database (root)"
      echo "-p, --password=STRING      pasword for database, default blank"
      echo "-n, --name=STRING          name of the database, defaults to using dev name"
      echo "-i, --ingress              bool to know if new ingress controller should be used"
      echo "-fn,                       bool to know if fresh instance of namespace should be used"
      echo "-fs,                       bool to know if fresh instance of secrets should be used"
      echo "-v, --version=NUMBER       specify a version of mysql to use"
      exit 0
      ;;
    -i|--ingress)
      ingress=true
      echo "Ingress controller will be installed and port-forwarded to 80."
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
    --no-update)
      shouldNotUpdate="true"
      echo "Local database won't be updated"
      shift
      ;;
    -e)
      shift
      if test $# -gt 0; then
        env=$1
        echo "Using environment: $env"
      else
        echo "No environment specified. Using default environment: $env"
        break
      fi
      shift
      ;;
    --env*)
      if [[ `echo $1 | sed -e 's/^[^=]*=//g'` != "" ]]; then
        env=`echo $1 | sed -e 's/^[^=]*=//g'`
        echo "Using environment: $env"
      else
        echo "No environment specified. Using default environment: $env"
        break
      fi
      shift
      ;;
    -u)
      shift
      if test $# -gt 0; then
        localDbUser=$1
        echo "Username: $localDbUser"
      else
        echo "No username specified. Using default username: $localDbUser"
        break
      fi
      shift
      ;;
    --user*)
      if [[ `echo $1 | sed -e 's/^[^=]*=//g'` != "" ]]; then
        env=`echo $1 | sed -e 's/^[^=]*=//g'`
        echo "Username: $localDbUser"
      else
        echo "No username specified. Using default username: $localDbUser"
        break
      fi
      shift
      ;;
    -p)
      shift
      if test $# -gt 0; then
        localDbPassword=$1
        echo "Using password: $localDbPassword"
      else
        echo "No password specified. Using default password: $localDbPassword"
        break
      fi
      shift
      ;;
    --password*)
      if [[ `echo $1 | sed -e 's/^[^=]*=//g'` != "" ]]; then
        localDbPassword=`echo $1 | sed -e 's/^[^=]*=//g'`
        echo "Using password: $localDbPassword"
      else
        echo "No password specified. Using default password: $localDbPassword"
        break
      fi
      shift
      ;;
    -n)
      shift
      if test $# -gt 0; then
        localDbName=$1
        echo "Using database name: $localDbName"
      else
        echo "No database name specified. Using default name: $localDbName"
        break
      fi
      shift
      ;;
    --name*)
      if [[ `echo $1 | sed -e 's/^[^=]*=//g'` != "" ]]; then
        localDbName=`echo $1 | sed -e 's/^[^=]*=//g'`
        echo "Using database name: $localDbName"
      else
        echo "No database name specified. Using default name: $localDbName"
        break
      fi
      shift
      ;;
    -v)
      shift
      if test $# -gt 0; then
        mysqlVersion=$1
        echo "Using mysql version: $mysqlVersion"
      else
        echo "No verison specified. Using default version: $mysqlVersion"
        break
      fi
      shift
      ;;
    --version*)
      if [[ `echo $1 | sed -e 's/^[^=]*=//g'` != "" ]]; then
        mysqlVersion=`echo $1 | sed -e 's/^[^=]*=//g'`
      else
        echo "No verison specified. Using default version: $mysqlVersion"
        break
      fi
      shift
      ;;
    *)
      break
      ;;
  esac
done
stackname='wordpress-test'
# Start ingress
if [ $ingress = true ]; then 
kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/controller-v1.1.2/deploy/static/provider/cloud/deploy.yaml
sleep 20
kubectl delete -A ValidatingWebhookConfiguration ingress-nginx-admission
sudo kubectl port-forward --namespace=ingress-nginx service/ingress-nginx-controller 80:80
exit 0
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
if $(cat /etc/hosts | grep -q wordpress.test);then
 sudo sed -i -e "s/.*wordpress.test.*/$(echo "127.0.0.1 wordpress.test")/" /etc/hosts;
 else 
 echo "127.0.0.1 wordpress.test" | sudo tee -a /etc/hosts;
fi

# Deploy stack
export HOST_IP=$(ipconfig getifaddr en0) && envsubst < stack.yml | kubectl apply -f - --namespace=$stackname
sleep 3
export HOST_IP=$(ipconfig getifaddr en0) && envsubst < stack.yml | kubectl apply -f - --namespace=$stackname
