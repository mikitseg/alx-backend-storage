#!/usr/bin/env python3
"""
Module: nginx_log_stats

This module provides statistics about Nginx logs stored in MongoDB.

Functions:
    log_stats(mongo_collection, option=None):
        Provide some statistics about Nginx logs stored in MongoDB.
"""
from pymongo import MongoClient


METHODS = ["GET", "POST", "PUT", "PATCH", "DELETE"]
PIPE = [{"$group": {"_id": "$ip", "count": {"$sum": 1}}},
        {"$sort": {"count": -1}}, {"$limit": 10}]


def log_stats(mongo_collection, option=None):
    """
    Provide some statistics about Nginx logs stored in MongoDB.

    Args:
        mongo_collection (pymongo.collection.Collection): The pymongo
        collection object.
        option (str, optional): The method to filter logs (default is None).

    Returns:
        None
    """
    items = {}
    if option:
        # Count documents matching the specified method
        value = mongo_collection.count_documents(
            {"method": {"$regex": option}})
        print(f"\tmethod {option}: {value}")
        return

    # Count all logs in the collection
    result = mongo_collection.count_documents(items)
    print(f"{result} logs")
    print("Methods:")
    # Iterate through each method and print the count of logs for each method
    for method in METHODS:
        log_stats(nginx_collection, method)
    # Count the number of logs with path="/status"
    status_check = mongo_collection.count_documents({"path": "/status"})
    print(f"{status_check} status check")
    print("IPs:")

    # Aggregate the top 10 most frequent IP addresses
    for ip in mongo_collection.aggregate(PIPE):
        print(f"\t{ip.get('_id')}: {ip.get('count')}")


if __name__ == "__main__":
    # Connect to the MongoDB server and
    # select the "logs" database and "nginx" collection
    nginx_collection = MongoClient('mongodb://127.0.0.1:27017').logs.nginx
    # Call the log_stats function with the nginx_collection
    log_stats(nginx_collection)
