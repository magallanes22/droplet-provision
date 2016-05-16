#!/bin/bash

echo " -----------------------------------"
echo "|      CREATING NEW DROPLET         |"				 
echo " -----------------------------------"
echo "Please fill the specs for the new droplet"
echo ""
read  -p "Name for the new droplet:  " droplet_name
echo " -----------------------------------"
echo "Enter region for the new droplet - PLEASE ENTER JUST A NUMBER"
read -p "1) New york - 2) France  " droplet_region
echo " -----------------------------------"
echo "Enter droplet size - PLEASE ENTER JUST A NUMBER"
read -p  "1) 512mb 2) 1gb  " droplet_size 
echo " -----------------------------------"
echo "Select base image for new droplet - PLEASE ENTER JUST A NUMBER"
read -p  "1) Ubuntu 14.04 " droplet_image

if [ $droplet_region -eq 1 ]
	then 
	   droplet_region="nyc3"
	else 
	   droplet_region="FRA1"
fi 

if [ $droplet_size -eq 1 ]
	then 
		droplet_size="512mb"
	else 
		droplet_size="1gb"
fi

if [ $droplet_image -eq 1 ]
	then 
		droplet_image="ubuntu-14-04-x64"
	else 
		droplet_image="ubuntu-14-04-x64"
fi

echo $droplet_image

#TOKEN=c4ba05708e6fe5cd430bb4168eacc9bb6fa039593fc9b2ab87fb6487ba2df469

#curl -X POST "https://api.digitalocean.com/v2/droplets" -d'{"name":"My-Droplet","region":"nyc2","size":"512mb","image":"ubuntu-14-04-x64"}' -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json"
#curl -X POST "https://api.digitalocean.com/v2/droplets" -d'{"name":""$droplet_name"","region":'$droplet_region',"size":'$droplet_size',"image":'$droplet_image'}' -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json
curl -X POST "https://api.digitalocean.com/v2/droplets" -d'{"name":"'"$droplet_name"'","region":"'"$droplet_region"'","size":"'"$droplet_size"'","image":"'"$droplet_image"'"}' -H "Authorization: Bearer $TOKEN" -H "Content-Type: application/json"