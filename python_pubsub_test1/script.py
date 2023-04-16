import redis
import threading

# Create a Redis client for the publisher
redis_publisher = redis.Redis(host='redis-stack', port=6379, db=0)

# Create a Redis client for the subscriber
redis_subscriber = redis.Redis(host='redis-stack', port=6379, db=0)

# Define a function that publishes messages to a channel
def publish_message(channel, message):
    print("Publishing message: ", message, " to channel: ", channel)
    redis_publisher.publish(channel, message)

# Define a function that subscribes to a channel and receives messages
def receive_messages(channel):
    print("Subscribing to channel...")
    pubsub = redis_subscriber.pubsub()
    pubsub.subscribe(channel)
    for message in pubsub.listen():
        if message['type'] == 'message':
            print(f'Received message: {message["data"].decode()}')

# Create a thread for receiving messages
print("Starting subscriber thread...")
subscriber_thread = threading.Thread(target=receive_messages, args=('mychannel',))
subscriber_thread.start()

# Publish some messages
print("Publishing messages...")
publish_message('mychannel', 'Hello, world!')
publish_message('mychannel', 'How are you?')

# Wait for the subscriber thread to finish receiving messages
print("Waiting for subscriber thread to finish...")
subscriber_thread.join()

print("Done!")
