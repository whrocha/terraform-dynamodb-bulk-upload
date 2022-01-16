import awswrangler as wr
import boto3
import json


def run():

    table_file = './out.json'

    print('Starting ...')

    print('Importing file:', table_file)

    # Opening JSON file
    with open(table_file) as f:

        # read json data
        data = json.load(f)

        # set region
        my_session = boto3.Session(region_name=data['region'])

        # insert items
        wr.dynamodb.put_items(
            items=data['items'],
            table_name=data['table_name'],
            boto3_session=my_session
        )

    print('Done!')


if __name__ == '__main__':

    run()