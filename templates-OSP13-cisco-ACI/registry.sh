openstack overcloud container image prepare \
 --output-env-file ~/templates/docker-registry.yaml \
 --namespace registry.access.redhat.com/rhosp13 \
 --prefix openstack- \
 --push-destination=10.173.20.2:8787 \
 --output-images-file /home/stack/local_registry_images.yaml \
 --set ceph_namespace=registry.access.redhat.com/rhceph \
 --set ceph_image=rhceph-3-rhel7 \
 --set ceph_tag=latest \
 -r /usr/share/openstack-tripleo-heat-templates/roles_data.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-rgw.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/ssl/enable-internal-tls.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/ssl/tls-everywhere-endpoints-dns.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/services/haproxy-public-tls-certmonger.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/services-docker/octavia.yaml \
 -e /home/stack/templates/custom-domain.yaml \
 -e /home/stack/templates/network-environment.yaml \
 -e /home/stack/templates/environments/25-hostname-map.yaml \
 -e /home/stack/templates/environments/30-fixed-ip-vips.yaml \
 -e /home/stack/templates/environments/30-ips-from-pool-all.yaml \
 -e /home/stack/templates/environments/35-ceph-config.yaml \
 -e /home/stack/templates/environments/40-neutron-ovn-dvr-ha.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/services/barbican.yaml \
 -e /usr/share/openstack-tripleo-heat-templates/environments/barbican-backend-simple-crypto.yaml

# # #####test repo############
# #
# # curl -X GET http://10.173.20.2:8787/v2/_catalog| jq .
sudo openstack overcloud container image upload   --config-file  /home/stack/local_registry_images.yaml   --verbose
