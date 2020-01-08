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

## Install and run tests by itself

Just do the usual

    pip install -r requirements.txt
    pytest
