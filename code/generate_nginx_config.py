#!/usr/bin/env python3
"""
    This script generates a nginx config file based on the given parameters
"""
__author__ = "Ernesto Serrano"
__license__ = "GPLv3"
__email__ = "erseco@correo.ugr.es"

from nginx.config.api import Config, Section, Location, EmptyBlock, KeyMultiValueOption
from copy import deepcopy

import random
import pprint
pp = pprint.PrettyPrinter(indent=4)

gene_ranges = [[512, 2048],   # worker_connections
               [10, 120],     # keepalive_timeout
               [0, 1],        # disable_symlinks
               [0, 1],        # autoindex
               [0, 1],        # send_timeout
               [512, 2048],   # large_client_header_buffers
               [512, 2048],   # client_max_body_size
               [0, 1],        # server_tokens
               [0, 1],        # gzip
               [0, 3],        # X-Frame-Options
               [0, 5],        # X-Powered-By
               [0, 1],        # X-Content-Type-Options
               [0, 2],        # server
               [0, 2],        # xss
               [0, 2]]        # content-policy

def generate_random_config():
    """
        Generate a random configuration, the positions are the selected NGINX
        directives to test, we have binary, integer and list directives
    """
    config = []
    for i in range(len(gene_ranges)):
        config.append( random.randint( gene_ranges[i][0], gene_ranges[i][1] ) )
    return config

def in_range_change( value, change, gene ):
    """
       Changes the value in gene by the quantity change taking into account ranges. Circles back to max or min if these are exceeded
    """
    
    new_value = value + change
    if new_value < gene_ranges[gene][0]:
        return gene_ranges[gene][1] +  gene_ranges[gene][0] - new_value + 1
    elif new_value > gene_ranges[gene][1]:
        return gene_ranges[gene][0] +  new_value - gene_ranges[gene][1]
    return new_value

def mutate_config( config ):
    """
        Selects a single element in the config and generates a "circular" mutation
        If any of the ranges is exceeded, gets out the other side
    """
    gene = random.randint(0, len(config) -1 )
    change = random.choice( [-1, 1] )
    new_config = config[:]
    new_config[gene] = in_range_change( config[gene], change, gene )
    return new_config


def set_directive_on_off(chromosome):
    return 'on' if chromosome else 'off'

def set_directive_int(chromosome):
    return chromosome


def set_directive_list(chromosome, list):

    try:
        a = list[chromosome]
    except e:
        print("ERRORAZO")
        print(chromosome)
        print(list)

    return list[chromosome]


def generate(config=generate_random_config()):
    """
        Generate a configuration based on the "config" variable, if this var
        is not setted we generate a random configuration with the function
        generate_random_config()
    """
    events = Section(
        'events',
        worker_connections=set_directive_int(config[0])
    )

    http = Section(
        'http',
        include='/etc/nginx/mime.types',
        default_type='application/octet-stream',
        access_log='/tmp/nginx-access.log',
        sendfile='on',
        keepalive_timeout=set_directive_int(config[1]),
        disable_symlinks=set_directive_on_off(config[2]),
        autoindex=set_directive_on_off(config[3]),
        send_timeout=set_directive_int(config[4]),
        large_client_header_buffers="%d %d" % (4, set_directive_int(config[5])),
        client_max_body_size=set_directive_int(config[6]) * 1024,
        server_tokens=set_directive_on_off(config[7]),
        gzip=set_directive_on_off(config[8]),
        log_format='my_tracking $request_body',
        resolver='8.8.8.8 valid=30s',

    )

    http.sections.add(
        Section(
            'server',
            Location(
                '^~ /assets/public/assets/',
                deny='all',
            ),
            Location(
                '^~ /assets/assets/',
                deny='all',
            ),
            Location(
                '/form',
                EmptyBlock(access_log=['/tmp/access.log', 'my_tracking']),
                # duplicate_options('return'=['200']),
            ),
            Location(
                '/',
                EmptyBlock(add_header=['X-Frame-Options:', set_directive_list(config[9], ['SAMEORIGIN', '"ALLOW-FROM http://www.exampletfm.com/"', 'DENY', 'WRONG VALUE'])]),
                EmptyBlock(add_header=['X-Powered-By:', set_directive_list(config[10], ['PHP/5.3.3', 'PHP/5.6.8', 'PHP/7.2.1', 'Django2.2', 'nginx/1.16.0', 'WRONG SERVER'])]),
                EmptyBlock(add_header=['X-Content-Type-Options:', set_directive_list(config[11], ['nosniff', '""'])]),
                EmptyBlock(add_header=['Server:', set_directive_list(config[12], ['apache', 'caddy', 'nginx/1.16.0'])]),
                EmptyBlock(add_header=['X-XSS-Protection:', set_directive_list(config[13], ["0", "1", '"1; mode=block"'])]),
                EmptyBlock(add_header=['Content-Security-Policy:', set_directive_list(config[14], ["\"default-src 'self'\"", "\"default-src 'none'\"", "\"default-src 'host *.google.com'\""])]),

                # add_header Content-Security-Policy "default-src 'self'; script-src 'self' 'unsafe-inline' 'unsafe-eval'
                # root='/var/lib/nginx/html/',
                root='/tester/site/',
                index='index.html index.htm',
                proxy_pass='http://juice-shop:3000',
            ),
            server_name='www.exampletfm.com',
            listen=80,
            error_page='500 502 503 504  /50x.html'
        )
    )

    nginx = Config(
        events,
        http,
        user='nginx',
        pid='/var/run/nginx.pid',
        worker_processes=1,
        daemon='on',  # passed in Dockerfile CMD
        error_log='/tmp/nginx-error.log warn',
    )
    # print(nginx)

    # Return the generated configuration
    return nginx
