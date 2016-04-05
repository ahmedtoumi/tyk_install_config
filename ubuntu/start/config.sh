# 1. Configure Tyk Gateway

#You can set up the core settings for Tyk Gateway with a single setup script.
#However for more involved deployments, you will want to provide your own configuration file, to get things running lets run:
#take a look at tyk.conf (by default it'll be at /opt/tyk-gateway/install/tyk.conf)
sudo /opt/tyk-gateway/install/setup.sh --dashboard=1 --listenport=8080 --redishost=localhost --redisport=6379 --domain="" --mongo=mongodb://localhost/tyk_analytics

# This is a description of those arg (source is tyk's official wiki)
# --dashboard=1: We want to use the dashboard, so to enable all the flags for using MongoDB and Analytics tracking
# --listenport=8080 Tyk should listen on port 8080 for API traffic
# --redishost=localhost Use redis on the hostname: localhost
# --redisport=6379 Use the default redis port
# --domain="" Do not set a domain for the gateway, see the note on domains below for more about this
# --mongo=mongodb://localhost/tyk_analytics Use this connection string to connect to the local MongoDB instance and use the tyk_analytics database

# 2. Configure Tyk Dashboard
#take a look at /opt/tyk-dashboard/install/tyk_analytics.conf
sudo /opt/tyk-dashboard/install/setup.sh --listenport=3000 --redishost=localhost --redisport=6379 --mongo=mongodb://localhost/tyk_analytics --tyk_api_hostname=$HOSTNAME --tyk_node_hostname=http://localhost --tyk_node_port=8080 --portal_root=/portal --domain="XXX.XXX.XXX.XXX"

# This is a description of those arg (source is tyk's official wiki)
# --listenport=3000 Told Tyk Dashboard (and Portal) to listen on port 3000
# --redishost=localhost Tyk Dashboard should use the local redis instance
#--redisport=6379 Tyk Dashboard should use the default port
# --domain="XXX.XXX.XXX.XXX" Bind the dashboard to the IP or DNS hostname of this instance (required)
# --mongo=mongodb://localhost/tyk_analytics Use the local MongoDB (should always be the same as the gateway)
# --tyk_api_hostname=$HOSTNAME – Tyk Dashboard has no idea what hostname has been given to Tyk, so we need to tell it, in this instance we are just using the local HOSTNAME env variable, but you could set this to the public-hostname/IP of the instance
# --tyk_node_hostname=http://localhost – Tyk Dashboard needs to see a Tyk node in order to create new tokens, so we need to tell it where we can find one, in this case, use the one installed locally
# --tyk_node_port=8080 Tell the dashboard that the Tyk node it should communicate with is on port 8080
# --portal_root=/portal – We want the portal to be shown on /portal of whichever domain we set for the portal
