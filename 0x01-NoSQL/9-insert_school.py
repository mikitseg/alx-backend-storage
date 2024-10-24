#!/usr/bin/env python3

"""
Module: mongo_document_inserter

This module provides functionality to insert a new document
into a MongoDB collection based on kwargs.

Functions:
    insert_school(mongo_collection, **kwargs):
        Insert a new document into a collection based on kwargs
        and return the new _id.

"""

def insert_school(mongo_collection, **kwargs):
    """
    Insert a new document into a collection based on kwargs and
    return the new _id.

    Args:
        mongo_collection (pymongo.collection.Collection): The pymongo
        collection object.
        **kwargs: Keyword arguments representing the fields
        and values of the new document.

    Returns:
        bson.objectid.ObjectId: The _id of the newly inserted document.
    """
    new_document = mongo_collection.insert_one(kwargs)
    return new_document.inserted_id
