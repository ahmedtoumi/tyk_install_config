#Configure Tyk Gateway

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

