1 - docker compose run --rm terraform
2 - terraform init/plan/apply
3 - ssh into vm:
	gcloud compute ssh default-001 \
	 --project=betterwse-analytics \
         --zone=europe-north1-a
4 - check docker is running:
	sudo docker ps
5 - access kibana:  http://external_ip:5601/
6 - stop vm (ssh first):
	gcloud compute instances stop default-001 \
	 --zone=europe-north1-a \
	 --project=betterwse-analytics
7 - In terraform terminal:
	terraform destroy
	

