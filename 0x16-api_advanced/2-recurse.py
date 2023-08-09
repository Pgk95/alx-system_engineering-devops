#!/usr/bin/python3
"""queries a given subreddit"""
import requests


def recurse(subreddit, hot_list=[]):
    """Queries and returns a list of titles of hot posts"""
    url = f'https://www.reddit.com/r/{subreddit}/hot/.json'
    headers = {'User-Agent': 'MyRedditBot/1.0'}
    hot_list = []
    after = ""
    count = 0

    while True:
        params = {'after': after, 'count': count, 'limit': 100}

        response = requests.get(url, headers=headers, params=params,
                                allow_redirects=False)
        if response.status_code == 404:
            return None
        data = response.json().get('data')
        after = data.get('after')
        count += data.get('dist')

        for post in data.get('children'):
            hot_list.append(post.get('data').get('title'))

        if after is None:
            break
    return hot_list
