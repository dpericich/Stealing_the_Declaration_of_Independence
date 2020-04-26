## Script to share the Declaration of Indepence with everyone!
## url for text service https://www.textmagic.com/docs/api/python/

import csv
import textmagic.rest from TextmagicRestClient

with open('natltreasure.csv', newline='') as f:
    reader = csv.reader(f)
    words = list(reader)

username = "textmagic_username"
token = "apiv2_key"
client =TextmagicRestClient(username, token)

for word in words:
    message = client.messages.create(phone ='#', text=f'{word}')
