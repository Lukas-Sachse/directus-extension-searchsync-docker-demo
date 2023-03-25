module.exports = {
  server: {
    type: 'meilisearch',
    host: 'http://host.docker.internal:7700',
    key: '<your-api-key>',
  },
  reindexOnStart: true,
  collections: {
    test_collection: {
      fields: ['title', 'description'],
    },
  },
}
