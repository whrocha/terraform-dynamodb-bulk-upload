# terraform-dynamodb-bulk-upload

Based on [Medium post from @jacob-hudson](https://dev.to/jacob_hudson/bulk-dynamodb-item-upload-with-terraform-1inp).

I've did some modifications to my necessity, I need to load from an external json file. I use an external [python script](./load_dynamo_items.py) to load the data into dynamodb, in these way I can load more than 25 items into a dynamodb table.
