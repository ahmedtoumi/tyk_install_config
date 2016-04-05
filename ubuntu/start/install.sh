#those scripts are based on the official website of tyk : https://tyk.io/v1.9/setup/install-tyk-ubuntu/

#1. Set up our APT repositories:

#First, add our GPGP key which signs our binaries:
curl https://packagecloud.io/gpg.key | sudo apt-key add -

#Do the same for Mongo (this may change, correct at time of writing):
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10

#Run update:
sudo apt-get update

#Since our repositories are installed via HTTPS, you will need to make sure APT supports this:
sudo apt-get install -y apt-transport-https

#Now lets add the required repos and update again (notice the -a flag in the second Tyk commands - this is important!):
# this step allow to :
#    Add the Mongo DB repository for the latest version (3.0 as of time of writing)
#    Add the Tyk Gateway and Tyk Dashboard repositories
#    Updat our package list


echo "deb http://repo.mongodb.org/apt/ubuntu trusty/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

echo "deb https://packagecloud.io/tyk/tyk-gateway/ubuntu/ trusty main" | sudo tee /etc/apt/sources.list.d/tyk_tyk-gateway.list

echo "deb-src https://packagecloud.io/tyk/tyk-gateway/ubuntu/ trusty main" | sudo tee -a /etc/apt/sources.list.d/tyk_tyk-gateway.list

echo "deb https://packagecloud.io/tyk/tyk-dashboard/ubuntu/ trusty main" | sudo tee /etc/apt/sources.list.d/tyk_tyk-dashboard.list

echo "deb-src https://packagecloud.io/tyk/tyk-dashboard/ubuntu/ trusty main" | sudo tee -a /etc/apt/sources.list.d/tyk_tyk-dashboard.list

sudo apt-get update

#We’re now ready to install Tyk Gateway and tyk Dashboard, along with all the main dependencies: Redis and MongoDB
sudo apt-get install -y mongodb-org redis-server tyk-gateway tyk-dashboard
