import requests
import json
import os
from time import sleep

########################################################################################################################
# The following variables in capital letters are meant to be configured.
########################################################################################################################

API_BASE_URL = 'https://data.lacity.org/resource/8yfh-4gug.json'

RESULTS_PER_PAGE = 50

TOTAL_RESULTS_LIMIT = 1

STORAGE_DIRECTORY = "data/api_responses"

SLEEP_INTERVAL_SECS = 0.2
########################################################################################################################


def get_url(limit, offset):
    """
    Get the URL for making the API request. 
    :param limit: integer
    :param offset: integer
    :return: string
    """
    return f"{API_BASE_URL}?$limit={limit}&$offset={offset}"


def save_to_file(data, n):
    """
    Save the data structure to a file (name designated by n).
    Zero-padding is used when naming the files to help ensure the proper ordering when the directory is read by
    the transform process.
    :param data: mixed
    :param n: integer
    :return: nil
    """
    filename = os.path.join(STORAGE_DIRECTORY, f"{n:010}.json")
    with open(filename, "w") as f:
        json.dump(data, f)


def prepare_storage_directory():
    """
    Ensure that the storage directory is ready for storing files.
    If the storage directory does not exist, create it
    :return:
    """
    if not os.path.exists(STORAGE_DIRECTORY):
        os.makedirs(STORAGE_DIRECTORY)

    if not os.path.isdir(STORAGE_DIRECTORY):
        raise Exception(f"Storage location is not a directory: {STORAGE_DIRECTORY}")


def make_request(url):
    """
    Make the external HTTP request
    :param url: string
    :return: object
    """
    return requests.get(url).json()


def is_complete(total_records_so_far, records_this_request):
    """
    Are we done making requests yet? This can be because we gathered enough records (per a non-zero TOTAL_RESULTS_LIMIT)
    or it could be that we exhausted the result set by paginating through it all.
    :param total_records_so_far:
    :param records_this_request:
    :return: boolean
    """
    if TOTAL_RESULTS_LIMIT and total_records_so_far + records_this_request >= TOTAL_RESULTS_LIMIT:
        return True
    elif records_this_request == 0:
        return True
    else:
        return False


def do_extraction():
    """
    Do the loop, make multiple requests to get our data and write it to files.
    :return:
    """
    prepare_storage_directory()
    this_offset = 0
    n = 1
    records_retrieved_count = 0
    while True:
        url = get_url(RESULTS_PER_PAGE, this_offset)
        print(f"Requesting {url}")
        response_data = make_request(url)
        save_to_file(response_data, n)

        # Keep our running total updated so we can stop the loop
        if is_complete(records_retrieved_count, len(response_data)):
            break
        else:
            records_retrieved_count = records_retrieved_count + len(response_data)

        # Bump our variables for the next iteration
        this_offset = this_offset + RESULTS_PER_PAGE
        n = n + 1
        # Be nice to the API
        sleep(SLEEP_INTERVAL_SECS)

    print("Done.")


if __name__ == "__main__":
    do_extraction()
