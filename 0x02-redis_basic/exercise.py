#!/usr/bin/env python3

"""
Module: redis_cache

This module provides a Cache class that interacts with Redis
to store and retrieve data.
It includes functionalities to count method calls and keep a
history of inputs and outputs.

Classes:
    Cache:
        A class to store and retrieve data from Redis.

Functions:
    count_calls(method):
        A decorator to count how many times methods of the Cache
        class are called.
    call_history(method):
        A decorator to store the input parameters and output
        results of Cache class methods.
"""

import sys
from functools import wraps
from typing import Union, Optional, Callable
from uuid import uuid4

import redis

UnionOfTypes = Union[str, bytes, int, float]


def count_calls(method: Callable) -> Callable:
    """
    Count how many times methods of the Cache class are called.

    Args:
        method (Callable): The method to be decorated.

    Returns:
        Callable: The wrapped method.
    """
    key = method.__qualname__

    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """
        Wrapper function to increment the call count.

        Args:
            self: The instance of the Cache class.
            *args: The positional arguments for the method.
            **kwargs: The keyword arguments for the method.

        Returns:
            The result of the method call.
        """
        self._redis.incr(key)
        return method(self, *args, **kwargs)

    return wrapper


def call_history(method: Callable) -> Callable:
    """
    Store the input parameters and output results of Cache class methods.

    Args:
        method (Callable): The method to be decorated.

    Returns:
        Callable: The wrapped method.
    """
    key = method.__qualname__
    inputs_key = f"{key}:inputs"
    outputs_key = f"{key}:outputs"

    @wraps(method)
    def wrapper(self, *args, **kwargs):
        """
        Wrapper function to store inputs and outputs.

        Args:
            self: The instance of the Cache class.
            *args: The positional arguments for the method.
            **kwargs: The keyword arguments for the method.

        Returns:
            The result of the method call.
        """
        self._redis.rpush(inputs_key, str(args))
        result = method(self, *args, **kwargs)
        self._redis.rpush(outputs_key, str(result))
        return result

    return wrapper


class Cache:
    """
    A Cache class to interact with Redis for storing and retrieving data.
    """

    def __init__(self):
        """
        Initialize the Cache class and flush the Redis database.
        """
        self._redis = redis.Redis()
        self._redis.flushdb()

    @count_calls
    @call_history
    def store(self, data: UnionOfTypes) -> str:
        """
        Store the input data in Redis using a randomly generated key
        and return the key.

        Args:
            data (UnionOfTypes): The data to be stored.

        Returns:
            str: The randomly generated key.
        """
        key = str(uuid4())
        self._redis.set(key, data)
        return key

    def get(self, key: str, fn: Optional[Callable] = None) -> UnionOfTypes:
        """
        Retrieve data from Redis and optionally convert it using
        a provided function.

        Args:
            key (str): The key to retrieve the data.
            fn (Optional[Callable], optional): The function to
            convert the data.

        Returns:
            UnionOfTypes: The retrieved data.
        """
        data = self._redis.get(key)
        return fn(data) if fn else data

    def get_int(self: bytes) -> int:
        """
        Convert bytes to an integer.

        Args:
            self (bytes): The bytes to convert.

        Returns:
            int: The converted integer.
        """
        return int.from_bytes(self, sys.byteorder)

    def get_str(self: bytes) -> str:
        """
        Convert bytes to a string.

        Args:
            self (bytes): The bytes to convert.

        Returns:
            str: The converted string.
        """
        return self.decode("utf-8")
