# Ansible Lab on Docker

I'll update this with more detailed and, hopefully, useful information soon.

## TL;DR;

Run the following command:

    docker-compose up -d

You should see something similar to this:

    [+] Running 4/4
    ⠿ Network ansible_lab_ansible-net  Created                                                 0.0s
    ⠿ Container host01                 Started                                                 0.6s
    ⠿ Container host02                 Started                                                 0.6s
    ⠿ Container controller             Started                                                 0.5s

Attach to the 'controller' container

    docker exec -it controller /bin/bash

Run a quick ad-hoc command against the 2 hosts

    [root@controller ~]#ansible -i inventory -m ping

Detach from the 'controller' container by pressing CTRL-p followed by CTRL-q