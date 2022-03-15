
 ansible multi -i inventory -a "hostname" 
 ansible-playbook   -i inventory ubunud_kube_install_control_plane.yml
ansible-playbook   -i inventory ubunud_kube_install_control_plane.yml --limit 192.168.60.4 
 # from test vagrant folder
 # vagrant ssh master1 