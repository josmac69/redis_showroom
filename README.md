# Redis showroom
My experiences, learnings and tests of Redis

* [Run Redis Stack on Docker](https://redis.io/docs/stack/get-started/install/docker/)
  * we can use different images:
    * redis/redis-stack - contains both Redis and RedisInsight
    * redis/redis-stack-server - contains only Redis

***

ChatGPT4:

Redis is an open-source, in-memory data structure store that is commonly used as a database, cache, and message broker. It is designed to provide high performance, scalability, and availability, and it supports a wide range of data structures and operations, such as strings, hashes, lists, sets, sorted sets, and geospatial indexes. Redis was originally created by Salvatore Sanfilippo in 2009 and is now maintained by Redis Labs.

Redis architecture:
The architecture of Redis consists of a single-threaded event loop that handles all incoming client connections, network I/O, and internal tasks. The event loop uses a non-blocking I/O model and a single shared data structure called the Redis database, which is stored entirely in memory. The Redis database is organized as a key-value store, where each key is a unique string that maps to a value that can be one of several data types, depending on the operation being performed.

Redis also supports several advanced features, such as replication, clustering, persistence, Lua scripting, and pub/sub messaging. Replication allows multiple Redis instances to synchronize their data with each other, providing high availability and fault tolerance. Clustering allows Redis to distribute its data across multiple nodes, providing horizontal scalability and load balancing. Persistence allows Redis to save its data to disk, providing durability and data recovery in case of failures. Lua scripting allows Redis to execute custom scripts inside the server, providing flexible and efficient data processing. Finally, pub/sub messaging allows Redis clients to subscribe to channels and receive messages in real-time, providing a scalable and efficient messaging system.

#### Use cases for Redis:

* Caching: Redis is commonly used as a cache for frequently accessed data, such as web pages, session data, and user profiles. By keeping this data in memory, Redis can provide fast and efficient access, reducing the load on the underlying database or API.
* Real-time analytics: Redis can be used to store and analyze real-time data, such as web analytics, social media metrics, and sensor data. By using Redis's data structures and Lua scripting capabilities, developers can perform complex computations and aggregations in real-time, providing immediate insights and decision-making.
* Queuing: Redis can be used as a message broker or task queue, allowing applications to process tasks in a distributed and asynchronous manner. By using Redis's pub/sub messaging or list data structures, developers can implement reliable and scalable message processing, reducing the risk of message loss or duplication.
* Leaderboards and rankings: Redis's sorted set data structure is commonly used to implement leaderboards and rankings, such as in online games or social networks. By storing users' scores or rankings in a sorted set, developers can perform efficient queries and updates, providing a responsive and engaging user experience.
* Geospatial data: Redis's geospatial indexes are commonly used to store and query location-based data, such as maps, store locators, and geofencing. By using Redis's geospatial commands and indexes, developers can perform fast and efficient queries, providing a responsive and accurate location-based service.

In summary, Redis is an in-memory data structure store that provides high performance, scalability, and availability. Its architecture consists of a single-threaded event loop and a shared in-memory database, and it supports several advanced features such as replication, clustering, persistence, Lua scripting, and pub/sub messaging. Redis is commonly used for caching, real-time analytics, queuing, leaderboards and rankings, and geospatial data, among other use cases.
