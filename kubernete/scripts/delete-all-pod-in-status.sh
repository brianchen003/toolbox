STATUS='Terminating'
kubectl get pods --all-namespaces | grep $STATUS  | while read line; do  
  pod_name=$(echo $line | awk '{print $2}' ) \
  name_space=$(echo $line | awk '{print $1}' ); \
  kubectl delete pods $pod_name -n $name_space --grace-period=0 --force
done
