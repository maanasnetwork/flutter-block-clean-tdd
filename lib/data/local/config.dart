class AppDatabaseConfig {
  static const String databaseName = 'database.db';
  static const int databaseVersion = 1;
  static const createTablesQueries = [
    'CREATE TABLE IF NOT EXISTS User(id INTEGER PRIMARY KEY, name TEXT, avatar TEXT, email TEXT, password TEXT, token TEXT, birthDate NUMERIC)',
  ];
}
