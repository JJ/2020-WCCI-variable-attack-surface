from generate_nginx_config import *
import random
import pytest

"""Pytest TDD Test definition file"""
__author__ = "Ernesto Serrano & JJ Merelo "
__license__ = "GPLv3"
__email__ = "erseco@correo.ugr.es & jjmerelo@gmail.com"

class TestClass:

    def setup_method(self ):
        self.config = generate_random_config()

    def test_initial_config( self ):
        assert len(self.config) == 15
        for i in range(0,len(self.config)):
            assert self.config[i] >= gene_ranges[i][0]
            assert self.config[i] <= gene_ranges[i][1]
