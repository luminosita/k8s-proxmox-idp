#!/bin/bash

#IFS='\n'
pvcs=$(kubectl get pvc -n vault -o jsonpath='{.items[*].metadata.name}') 
for pvc in $pvcs; 
do
	kubectl patch pvc $pvc -n vault -p '{"metadata":{"finalizers":null}}' --type=merge
	kubectl delete pvc $pvc -n vault
done

#pvs=$(kubectl get pv -o jsonpath='{.items[*].metadata.name}') 
#for pv in $pvs; 
#do
#	kubectl patch pv $pv -p '{"metadata":{"finalizers":null}}' --type=merge
#	kubectl delete pv $pv --grace-period=0
#done


