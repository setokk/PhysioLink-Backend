const DatabaseConnector = require('./DatabaseConnector');
const DB_CONN_LIMIT = 5;
const driver = new DatabaseConnector("localhost", "root", "root", DB_CONN_LIMIT);

module.exports = driver;