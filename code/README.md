# Moving Target Defense

To deploy a server:


wget -qO- https://get.docker.com/ | sh
sudo usermod -aG docker $USER
git clone https://github.com/JJ/2020-WCCI-variable-attack-surface.git
sudo apt install -y htop fail2ban
sudo curl -L https://github.com/docker/compose/releases/download/1.21.0/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

How to run the sample code:

```
docker-compose build
docker-compose up -d
docker-compose exec www.exampletfm.com sh
```
Inside the www.exampletfm.com container:
```
python3 genetic.py
```

or

```
docker-compose exec www.exampletfm.com python3 genetic.py --individuals=16
```

## Install and run tests by itself

You need to have nginx installed first, do it using your OS command.

Just do the usual

    pip install -r requirements.txt
    pytest
