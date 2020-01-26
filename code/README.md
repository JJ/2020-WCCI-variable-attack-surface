# Moving Target Defense

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
