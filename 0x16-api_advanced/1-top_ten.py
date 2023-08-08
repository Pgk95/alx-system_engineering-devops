#!/usr/bin/python3
"""Queries a given subreddit"""

import requests
import json


def top_ten(subreddit):
    """queries and prints the titles of the first 10 posts
    """

    url = "https://api.reddit.com/r/{}/hot/.json?limit=10".format(subreddit)
    response = requests.get(url)
    if response.status_code != 200:
        print("Error getting top posts: {}".format(response.status_code))
        return

    response_json = json.loads(response.content)
    posts = response_json["data"]["children"]

    for post in posts:
        title = post["data"]["title"]
        print(title)
