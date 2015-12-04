FROM sandbox/neutron:base
MAINTAINER MidoNet (http://midonet.org)

COPY conf/cloudarchive-ost.list /etc/apt/sources.list.d/cloudarchive-ost.list
COPY conf/midonet-plugin.list /etc/apt/sources.list.d/midonet-plugin.list

RUN apt-get install -qy ubuntu-cloud-keyring
RUN apt-get -q update
RUN apt-get install -qy --no-install-recommends \
                            neutron-server \
                            python-neutron-lbaas \
                            python-neutronclient \
                            python-keystoneclient \
                            python-neutron-plugin-midonet

RUN mkdir -p /etc/neutron/plugins/midonet
RUN mv /midonet_conf/midonet.ini /etc/neutron/plugins/midonet/midonet.ini
RUN mv /midonet_conf/neutron_lbaas.conf /etc/neutron/neutron_lbaas.conf
RUN mv /midonet_conf/neutron-server /etc/default/neutron-server
