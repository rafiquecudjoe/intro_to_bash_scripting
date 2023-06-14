#!/bin/bash

fortunes=("Your hard work in Azubi Africa will pay off very soon"
          "You will have great success in the near futue in cloud computing"
	  "beware of unexpected opportunities in disguise")
random_index=$((RANDOM % ${#fortunes[@]}))

echo "Welcome to the fortune teller"
echo "Your fortune for today is:"
echo "${fortunes[random_index]}"
