class DatabaseConnector
{
    // Private property of MariaDB driver
    #mariadb = require('mariadb');
    
    // Pool for running queries (created in constructor)
    #pool;

    constructor(host, user, password, connectionLimit)
    {
        this.#pool = this.#mariadb.createPool({
            host: host,
            port: 6034,
            user: user,
            password: password,
            connectionLimit: connectionLimit,
            database: 'physiolink'
        });
    }

    async executeQuery(query)
    {
        let conn;
        try {
            conn = await this.#pool.getConnection();
            const rows = await conn.query(query);
            return rows;

        } catch (err) {
            throw err;
        } finally {
            if (conn) conn.end();
        }
    }
}

module.exports = DatabaseConnector;