# !/usr/bin/bash

pokemonName=$1

if [ "$pokemonName" = "" ]
then
	echo You should write a Pokemon name.
else
	data=$(curl https://pokeapi.co/api/v2/pokemon/$pokemonName)
	if [ "$data" = "Not Found" ]
	then
		echo You should write a valid Pokemon name.
	else
		id=$(echo $data| jq .id)
		name=$(echo $data | jq .name)
		weight=$(echo $data | jq .weight)
		height=$(echo $data | jq .height)
		order=$(echo $data | jq .order)
		echo id=$id, name=$name, weight=$weight, height=$height, order=$order.
	fi
fi
