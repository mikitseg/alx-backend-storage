#!/usr/bin/env python3
"""
Module: school_topic_search

This module provides functionality to retrieve a list of schools
having a specific topic.

Functions:
    schools_by_topic(mongo_collection, topic):
        Return a list of schools having a specific topic.
"""


def schools_by_topic(mongo_collection, topic):
    """
    Return a list of schools having a specific topic.

    Args:
        mongo_collection (pymongo.collection.Collection): The pymongo
        collection object.
        topic (str): The topic to search for.

    Returns:
        pymongo.cursor.Cursor: A cursor object containing
        the schools with the specified topic.
    """
    return mongo_collection.find({"topics": topic})
