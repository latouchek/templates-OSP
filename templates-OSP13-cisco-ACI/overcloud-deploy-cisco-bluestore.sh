#!/bin/bash
source ~/stackrc
exec openstack overcloud deploy \
        --templates /usr/share/openstack-tripleo-heat-templates \
        --timeout 180 \
        --verbose \
        -n /home/stack/templates/network_data.yaml \
        -r /home/stack/templates/roles_data.yaml \
        -p /usr/share/openstack-tripleo-heat-templates/plan-samples/plan-environment-derived-params.yaml \
        -e /home/stack/templates/global-config.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/network-environment.yaml \
        -e /home/stack/templates/network-environment.yaml \
        -e /home/stack/templates/cisco-environment.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/network-isolation.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-ansible.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/ceph-ansible/ceph-rgw.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/services/barbican.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/barbican-backend-simple-crypto.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/services-docker/octavia.yaml \
        -e /usr/share/openstack-tripleo-heat-templates/environments/disable-telemetry.yaml \
        -e /home/stack/templates/custom-domain.yaml \
        -e /home/stack/templates/environments/25-hostname-map.yaml \
        -e /home/stack/templates/environments/30-fixed-ip-vips.yaml \
        -e /home/stack/templates/environments/39-ceph-config.yaml \
        -e /home/stack/templates/docker-registry.yaml \
        -e /home/stack/templates/ciscoaci_containers.yaml \
        -e /home/stack/templates/first-boot-env.yaml \
        --log-file /home/stack/overcloud-deploy.log
