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

    [root@controller ~]#ansible -i inventory all -m ping

Run one of the provided sample playbooks against the 2 hosts

    [root@controller ~]# ansible-playbook add-user-var.yaml 

    PLAY [Add user to a system] ***************************************************************************************************************************************************************

    TASK [Add users to my hosts] **************************************************************************************************************************************************************
    changed: [host01] => (item=Homer)
    changed: [host02] => (item=Homer)
    changed: [host01] => (item=Marge)
    changed: [host02] => (item=Marge)
    changed: [host01] => (item=Bart)
    changed: [host02] => (item=Bart)
    changed: [host02] => (item=Lisa)
    changed: [host01] => (item=Lisa)

    PLAY RECAP ********************************************************************************************************************************************************************************
    host01                     : ok=1    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0   
    host02                     : ok=1    changed=1    unreachable=0    failed=0    skipped=0    rescued=0    ignored=0  

Detach from the 'controller' container by pressing CTRL-p followed by CTRL-q