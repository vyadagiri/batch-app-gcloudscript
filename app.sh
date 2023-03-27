gsutil mb -c standard -l europe-west2 gs://sourcefiles45356565433334
gsutil mb -c standard -l europe-west2 gs://destinationfiles3253533535

gcloud compute instances create batchapp \
--project=poc-adm-finserv-1133276 --zone=europe-west2-b --machine-type=n2-standard-4 --network-interface=subnet=int-europe-west2,no-address --metadata=source=gs://sourcefiles45356565433334,destination=gs://destinationfiles3253533535 --no-restart-on-failure --maintenance-policy=TERMINATE --provisioning-model=SPOT --instance-termination-action=STOP \
--service-account=gce-runtime@poc-adm-finserv-1133276.iam.gserviceaccount.com \
--scopes=https://www.googleapis.com/auth/cloud-platform \
--create-disk=auto-delete=yes,boot=yes,device-name=batchapp,image=projects/debian-cloud/global/images/debian-11-bullseye-v20230306,mode=rw,size=200,type=projects/poc-adm-finserv-1133276/zones/europe-west2-b/diskTypes/pd-balanced --no-shielded-secure-boot --shielded-vtpm --shielded-integrity-monitoring --labels=ec-src=vm_add-gcloud --reservation-affinity=any