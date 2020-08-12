# deploy

- aws/ec2起動、ubuntu20.04
- sudo apt update && sudo apt install docker.io
- docker pull tamura/moneta3
- docker run --name moneta3 -p 3000:3000 -d tamura/moneta3
- docker exec moneta3 /bin/bash
- rails db:migrate
- rails db:seed_fu
