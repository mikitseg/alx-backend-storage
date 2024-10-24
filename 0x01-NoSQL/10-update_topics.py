#!/usr/bin/env python3
"""
Module: school_topic_updater

This module provides functionality to update topics of school documents
in a MongoDB collection.

Functions:
    update_topics(mongo_collection, name, topics):
        Update topics for a specified school in the collection.
"""


def update_topics(mongo_collection, name, topics):
    """
    Update topics for a specified school in the collection.

    Args:
        mongo_collection (pymongo.collection.Collection): The pymongo
        collection object.
        name (str): The name of the school to update.
        topics (list of str): The list of topics approached in the school.

    Returns:
        None
    """
    mongo_collection.update_many({"name": name}, {"$set": {"topics": topics}})
