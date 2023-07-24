#!/usr/bin/python3

"""By using the provided REST API returns info about his/her TODO lists"""

import requests


def get_employee_todo_progress(employee_id):
    base_url = "https://jsonplaceholder.typicode.com"
    user_url = f"{base_url}/users/{employee_id}"
    todos_url = f"{base_url}/todos?userId={employee_id}"

    try:
        user_response = requests.get(user_url)
        todos_response = requests.get(todos_url)

        user_data = user_response.json()
        todos_data = todos_response.json()

        e_name = user_data['name']
        total_tasks = len(todos_data)
        done_tasks = sum(1 for todo in todos_data if todo['completed'])

        print(f"Employee {e_name} is done with "
              f"tasks({done_tasks}/{total_tasks}): ")

        for todo in todos_data:
            if todo['completed']:
                print(f"\t{todo['title']}")

    except requests.exceptions.RequestException as e:
        print(f"Error: {e}")
        return


if __name__ == "__main__":
    import sys

    if len(sys.argv) != 2:
        print("Usage: python script.py employee_id")
    else:
        employee_id = int(sys.argv[1])
        get_employee_todo_progress(employee_id)
