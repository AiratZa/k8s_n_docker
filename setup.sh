#!/bin/sh

function error_ocurred {
	echo "): Error occured :("
	minikube delete
	exit 1
}

minikube start --vm-driver=virtualbox

eval $(minikube docker-env)

minikube addons enable metallb

kubectl apply -f srcs/yaml_configs_for_k8s/metallb.yaml || error_ocurred

kubectl apply -f srcs/yaml_configs_for_k8s/volumes.yaml || error_ocurred

# docker build srcs/nginx -t "nginx_img" || error_ocurred

# docker build srcs/ftps -t "ftps_img" || error_ocurred

docker build srcs/mysql -t "mysql_img" || error_ocurred

docker build srcs/wordpress -t "wp_img" || error_ocurred

docker build srcs/phpmyadmin -t "phpmyadm_img" || error_ocurred


# kubectl apply -f srcs/yaml_configs_for_k8s/nginx.yaml || error_ocurred

# kubectl apply -f srcs/yaml_configs_for_k8s/ftps.yaml || error_ocurred

kubectl apply -f srcs/yaml_configs_for_k8s/mysql.yaml || error_ocurred

kubectl apply -f srcs/yaml_configs_for_k8s/wordpress.yaml || error_ocurred

kubectl apply -f srcs/yaml_configs_for_k8s/phpmyadmin.yaml || error_ocurred

