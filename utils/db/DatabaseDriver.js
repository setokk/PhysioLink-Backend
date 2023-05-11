const DatabaseConnector = require('./DatabaseConnector');
const DB_CONN_LIMIT = 5;
const driver = new DatabaseConnector("physiodb", "root", "root", DB_CONN_LIMIT);

module.exports = driver;