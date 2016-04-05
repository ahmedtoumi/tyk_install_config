#1. Start Tyk and Tyk dashboard

sudo service tyk-gateway start
sudo service tyk-dashboard sta

#2. Bootstrap the dashboard with an initial user and organisation:

sudo /opt/tyk-dashboard/install/bootstrap.sh XXX.XXX.XXX.XXX
#XXX.XXX.XXX.XXX is your domain or your IP
