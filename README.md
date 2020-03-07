# asrytikov_infra
#cloud-bastion
bastion_IP = 35.207.126.33
someinternalhost_IP = 10.156.0.5

Access to internalhost
ssh -J ak@35.207.126.33 ak@10.156.0.5

Access to aliases
host bastion
        hostname 35.207.126.33
        User ak

host internalhost
        hostname 10.156.0.5
        User ak
        ProxyJump bastion


testapp_IP = 35.198.156.110
testapp_port = 9292

#create instance for puma
gcloud compute instances create reddit-app  --boot-disk-size=10GB   --image-family ubuntu-1604-lts   --image-project=ubuntu-os-cloud   --machine-type=g1-small   --tags puma-server --reservation europe-west3-c   --restart-on-failure --metadata startup-script-url=gs://rytikov/fullscript.sh

#create firewall rule
gcloud compute firewall-rules create default-puma-server --allow tcp:9292 --source-ranges 0.0.0.0/0

#Terraform-1

При добавлении через веб-интерфейс ssh-ключ для appuser_web к какому-либо результату это действие не приведет. Данный ключ не описан в конфигурции terraform.

#Terraform-2

Настроено хранение стейт файла в удаленном бекенде.
При паралельном запуске применения конфигурации запускается блокировка применения конфигурации и появляется ошибка вида:
Error: Error locking state: Error acquiring the state lock: writing "gs://storage-bucket-262714/tf-state-prod/default.tflock" failed: googleapi: Error 412: Precondition Failed, conditionNotMet

#Ansible-1

При выполнении ansible app -m command -a 'rm -rf ~/reddit' папка reddit удаляется, при запуске плейбука clone.yml папка заново запишется и поэтому мы получаем сообщение changed=1

#Ansible-2

Создано несколько playbook для установки и настройки приложения

#Ansible-3

Разделение плайбуков на разные роли. Stage и Prod окружения. Nginx. Ansible Vault
