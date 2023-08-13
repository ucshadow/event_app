Ticket master event
Due to time limit, I did not map the api response to the local model with 100% accuracy
I tried to take only the data I would need for the app and build the local model as close
as possible to the Ticket master api one.

The 'attractions' data in the '_embedded' field is skipped all-together, even though
it seems that it may use most of the same model as 'Event', there is no point in adding it
as a main event can have up to 90 'attraction' events.

The 'venue' model is kept relatively simple to the actual venue model from the api.