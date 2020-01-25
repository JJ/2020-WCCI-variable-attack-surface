import genetic
import mock
import random
import pytest

"""Pytest TDD Test definition file"""
__author__ = "Ernesto Serrano & JJ Merelo "
__license__ = "GPLv3"
__email__ = "erseco@correo.ugr.es & jjmerelo@gmail.com"

def test_individual():
    """Test individual generation"""
    config = genetic.individual()
    assert(isinstance(config, list))
    assert(len(config) == genetic.genes)


def test_initialize():
    """Test population initalization"""
    assert(isinstance(population, list))
    assert(len(population) == genetic.individuals)


@mock.patch('genetic.calculate_fitness', return_value=1)
def test_selection_and_reproduction(function):
    """Test selection and reproduction"""
    result = genetic.selection_and_reproduction(population)

    assert(len(result) == len(population))


@mock.patch('random.random', return_value=0.1)
@mock.patch('fitness.generate_random_config', return_value=[200, 39, 0, 1, 0, 1033, 1933, 1, 0, 2, 3, 0, 1])
def test_mutation(function1, function2):
    """Test mutation function"""
    result = genetic.mutate(population)
    assert(len(result) == len(population))


@mock.patch('random.randint', return_value=6)
def test_crossover_one_point_6(function):
    """Test crossover function"""
    individual1 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    individual2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    expected_result = [0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1]
    result = genetic.crossover_one_point(individual1, individual2)
    assert(result == expected_result)


@mock.patch('random.randint', return_value=10)
def test_crossover_one_point_10(function):
    """Test crossover function"""
    individual1 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    individual2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    expected_result = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1]
    result = genetic.crossover_one_point(individual1, individual2)
    assert(result == expected_result)


@mock.patch('random.randint', return_value=11)
def test_crossover_one_point_11(function):
    """Test crossover function"""
    individual1 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    individual2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    expected_result = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1]
    result = genetic.crossover_one_point(individual1, individual2)
    assert(result == expected_result)


def test_crossover_two_points_7():
    """Test crossover function"""

    # We initialize the seed to get always the same random numbers
    random.seed(0)

    individual1 = [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
    individual2 = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

    expected_result = [1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0,0, 0, 1, 1]
    result = genetic.crossover_two_points(individual1, individual2)
    assert(result == expected_result)
