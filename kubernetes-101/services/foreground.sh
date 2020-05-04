minikube start --extra-config=apiserver.cloud-provider=aws --extra-config=controller-manager.cloud-provider=aws --wait=false
mkdir -p kubernetes101; cd /kubernetes101/
export HOST_IP="[[HOST_IP]]"
sed -i 's|\[\[HOST_IP\]\]|'$HOST_IP'|g' external.yaml
