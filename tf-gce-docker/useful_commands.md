# Before running the container, authenticate locally:
- gcloud auth application-default login

This creates credentials under:
~/.config/gcloud/application_default_credentials.json

# Docker
- docker compose run --rm terraform

# Inside Terrafrom bash 
- terraform init
- terraform apply

#SSH into vm
gcloud compute ssh default-001 \
  --project=betterwse-analytics \
  --zone=europe-north1-a

# Stop VM
gcloud compute instances stop default-001 \
  --zone=europe-north1-a \
  --project=betterwse-analytics

# start  VM
gcloud compute instances start default-001 \
  --zone=europe-north1-a \
  --project=betterwse-analytics


# check start-up script logs in vm
ssh into vm:
sudo journalctl -u google-startup-scripts.service

# force firewall
gcloud compute firewall-rules create allow-kibana-5601 \
  --allow=tcp:5601 \
  --source-ranges=$(curl -4 -s ifconfig.me)/32 \
  --description="Allow Kibana from my IP" \
  --project=betterwse-analytics

# Enable firewall rules
gcloud compute firewall-rules update allow-kibana-5601 \
  --no-disabled 
  --project=betterwse-analytics


#list projects and ids
gcloud projects list


# Potential errors

"Error: Error creating instance template: googleapi: Error 403: Compute Engine 
API has not been used in project . . ."

gcloud auth login

### Once logged in, set your default project:
gcloud config set project oli-project-1-474610

### Now retry the original command:
gcloud services enable compute.googleapis.com
