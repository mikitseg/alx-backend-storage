#!/usr/bin/env python3

"""
Module: mongo_document_lister

This module provides functionality to list all documents
in a MongoDB collection.

Functions:
    list_all(mongo_collection):
        List all documents in a collection.

"""


def list_all(mongo_collection):
    """
    List all documents in a collection.

    Args:
        mongo_collection (pymongo.collection.Collection): The pymongo
        collection object.

    Returns:
        pymongo.cursor.Cursor: A cursor object containing
        all documents in the collection.
    """
    documents = mongo_collection.find()
    return documents
