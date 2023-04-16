import redis

# Create a Redis client
redis_client = redis.Redis(host='redis-stack', port=6379, db=0)

# Define a function that performs a heavy computation
def heavy_computation(n):
    result = 0
    for i in range(n):
        result += i
    return result

# Define a function that uses Redis to cache the result of heavy_computation
def cached_heavy_computation(n):
    # Check if the result is already in the cache
    result = redis_client.get(str(n))
    if result is not None:
        print('Retrieving result from cache...')
        return int(result)
    # If the result is not in the cache, compute it and store it in the cache
    print('Computing result...')
    result = heavy_computation(n)
    redis_client.set(str(n), str(result))
    return result

# Test the cached_heavy_computation function
print("First call - This will compute the result and store it in the cache")
print(cached_heavy_computation(1000000))

print("Second call - This will retrieve the result from the cache")
print(cached_heavy_computation(1000000))
