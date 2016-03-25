if [ -f `pwd`/docker-compose.yml ]; then
  sudo docker-compose up -d
  sudo docker-compose logs --follow --timestamps
  sudo docker-compose stop
  sudo docker-compose rm --all --force -v
else
  echo "docker-compose.yml missing"
  exit 1
fi
