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
