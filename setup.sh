#!/bin/sh

function error_ocurred {
	echo "): Error occured :("
	minikube delete
	exit 1
}

minikube start --vm-driver=virtualbox

eval $(minikube docker-env)

minikube addons enable metallb

kubectl apply -f srcs/yaml_configs_for_k8s/metallb.yaml

kubectl apply -f srcs/yaml_configs_for_k8s/volumes.yaml

# docker build srcs/nginx -t "nginx_img"

# docker build srcs/ftps -t "ftps_img"

docker build srcs/mysql -t "mysql_img"

docker build srcs/wordpress -t "wp_img"

docker build srcs/phpmyadmin -t "phpmyadm_img"


# kubectl apply -f srcs/yaml_configs_for_k8s/nginx.yaml

# kubectl apply -f srcs/yaml_configs_for_k8s/ftps.yaml

kubectl apply -f srcs/yaml_configs_for_k8s/mysql.yaml

kubectl apply -f srcs/yaml_configs_for_k8s/wordpress.yaml

kubectl apply -f srcs/yaml_configs_for_k8s/phpmyadmin.yaml

