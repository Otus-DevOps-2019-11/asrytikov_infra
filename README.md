# asrytikov_infra
asrytikov Infra repository
Access to someinternalhost(10.156.0.4)
ssh -J ak@35.207.65.88 ak@10.156.0.5

Access to aliases
host bastion
        hostname 35.207.65.88
        User ak

host someinternalhost
        hostname 10.156.0.5
        User ak
        ProxyJump bastion
