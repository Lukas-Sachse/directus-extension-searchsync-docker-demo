# How to use this demo

⚠️ Disclaimer: Only tested with Meilisearch, Windows 11 and Docker Desktop.




## 1. Have a running instance of your search service
---
Example: Meilisearch running as a separate docker container and available at http://localhost:7700


## 2. Modify the searchsync.config.cjs
---
```js
server: {
    type: 'meilisearch',                        
    host: 'http://host.docker.internal:7700',   // accessing localhost within a container
    key: '<your-api-key>',                  
  },
   reindexOnStart: true,                        // Need ""true" for this tutorial
   collections: {
    test_collection: {                          // name of the directus-collection
      fields: ['title', 'description'],         // fields of the directus-collection
    },
  },
```

## 3. Run docker-compose.yml with build flag
---
```bash
docker compose -f docker-compose.yml up --build
```

## 4. Checking Loaded extensions & notice the warning
---
![step_4_notice_warning](https://user-images.githubusercontent.com/62059415/227744668-f0087436-0fcc-452b-a167-b72573ba0960.png)

If you see this, you know all is fine. We haven't created the collection yet.


## 5. Login to Directus with http://localhost:8055
---
```
// Initial values from .env

ADMIN_EMAIL=admin@example.com
ADMIN_PASSWORD=123qweasd
```

## 6. Create collection and fields
---
![step_6_create_collection](https://user-images.githubusercontent.com/62059415/227745170-a3ab95b0-b4da-4efc-98e5-1e0a30686ecc.png)


## 7. Create first item
---
![step_7_item](https://user-images.githubusercontent.com/62059415/227745752-30588489-6325-4c7d-b65f-96fe0fce3f00.png)


## 8. Restart Docker Containers
---
### Stop containers:

pressing `CTRL+C` (Windows) to cancel running command

### Start containers:
```bash
docker compose -f docker-compose.yml up
```


## 9. Check - No warning
---
![step_9_check](https://user-images.githubusercontent.com/62059415/227745489-5b9709ec-5171-416c-a3e3-9fb2d9ec2e71.png)


## 10. Check - Meilisearch Dashboard at http://localhost:7700
---
You should find the collection "test_collection" as an available index.
When selected, we should see our item.

![step_10_meilisearch](https://user-images.githubusercontent.com/62059415/227746477-d4a105a0-8b03-40ed-9c72-b7e57efbecb6.png)
