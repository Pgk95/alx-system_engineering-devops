#!/usr/bin/python3
"""Queries a given subreddit"""

import requests
import json


def top_ten(subreddit):
    """queries and prints the titles of the first 10 posts
    """

    url = "https://api.reddit.com/r/{}/hot/.json?limit=10".format(subreddit)
    headers = {'User-Agent': 'MyRedditBot/1.0'}
    params = {"limit": 10}

    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)
    if response.status_code != 200:
        print("None")
        return
    results = response.json().get("data")
    [print(c.get("data").get("title")) for c in results.get("children")]
