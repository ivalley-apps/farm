
 ansible multi -i inventory -a "hostname" 
 ansible-playbook   -i inventory ubunud_kube_install_control_plane.yml

 # from test vagrant folder
 # vagrant ssh master1 