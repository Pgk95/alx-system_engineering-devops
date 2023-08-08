#!/usr/bin/python3
"""queries the reddit API and returns the number of subs"""

import requests


def number_of_subscribers(subreddit):
    """Returns the number of subscribers."""
    headers = {'User-Agent': 'MyRedditBot/1.0'}

    url = "https://www.reddit.com/r/{}/about.json".format(subreddit)

    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 404:
            return 0
    results = response.json().get("data")
    return results.get("subscribers")
