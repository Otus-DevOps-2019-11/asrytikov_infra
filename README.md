# asrytikov_infra

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
