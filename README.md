# asrytikov_infra
asrytikov Infra repository
 bastion_IP = 35.207.126.33
 internalhost_IP = 10.156.0.5

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
