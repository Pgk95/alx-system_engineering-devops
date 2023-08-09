#!/usr/bin/python3
"""Queries a given subreddit"""

import requests


def count_words(subreddit, word_list, instances={}, after="", count=0):
    """Prints counts of given words found in a hot post"""
    url = "https://www.reddit.com/r/{}/hot/.json".format(subreddit)
    headers = {'User-Agent': 'MyRedditBot/1.0'}
    params = {'after': after, 'count': count, 'limit': 100}
    response = requests.get(url, headers=headers, params=params,
                            allow_redirects=False)
    try:
        results = response.json()
        if response.status_code == 404:
            raise Exception
    except Exception:
            print('')
            return

    results = results.get('data')
    after = results.get('after')
    count += results.get('dist')

    for post in results.get('children'):
        title = post.get('data').get('title').lower().split()
        for word in word_list:
            if word.lower() in title:
                times = title.count(word.lower())
                if instances.get(word) is None:
                    instances[word] = times
                else:
                    instances[word] += times

    if after is None:
        if not instances:
            print('')
            return

        sorted_instances = sorted(instances.items(),
                                  key=lambda kv: (-kv[1], kv[0]))
        for word, count in sorted_instances:
            print(f'{word}: {count}')
    else:
        count_words(subreddit, word_list, instances, after, count)
