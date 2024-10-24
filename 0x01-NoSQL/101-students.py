#!/usr/bin/env python3
"""
Module: student_ranking

This module provides functionality to retrieve all students
sorted by their average scores.

Functions:
    top_students(mongo_collection):
        Return all students sorted by average score.
"""


def top_students(mongo_collection):
    """
    Return all students sorted by average score.

    Args:
        mongo_collection (pymongo.collection.Collection): The pymongo
        collection object.

    Returns:
        pymongo.command_cursor.CommandCursor: A cursor object
        containing the sorted students.
    """
    return mongo_collection.aggregate([
        {
            "$project":
            {
                "name": "$name",
                "averageScore": {"$avg": "$topics.score"}
            }
        },
        {
            "$sort":
            {
                "averageScore": -1
            }
        }
    ])
