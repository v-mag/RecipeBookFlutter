// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Recipe.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

class $FloorRecipeDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$RecipeDatabaseBuilder databaseBuilder(String name) =>
      _$RecipeDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$RecipeDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$RecipeDatabaseBuilder(null);
}

class _$RecipeDatabaseBuilder {
  _$RecipeDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$RecipeDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$RecipeDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<RecipeDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$RecipeDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$RecipeDatabase extends RecipeDatabase {
  _$RecipeDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  RecipeDao? _recipeDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `Recipe` (`id` INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, `title` TEXT NOT NULL, `image` TEXT NOT NULL, `readyInMinutes` INTEGER NOT NULL, `servings` INTEGER NOT NULL, `aggregateLikes` INTEGER NOT NULL, `instructions` TEXT NOT NULL, `healthScore` INTEGER NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  RecipeDao get recipeDao {
    return _recipeDaoInstance ??= _$RecipeDao(database, changeListener);
  }
}

class _$RecipeDao extends RecipeDao {
  _$RecipeDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _recipeInsertionAdapter = InsertionAdapter(
            database,
            'Recipe',
            (Recipe item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'image': item.image,
                  'readyInMinutes': item.readyInMinutes,
                  'servings': item.servings,
                  'aggregateLikes': item.aggregateLikes,
                  'instructions': item.instructions,
                  'healthScore': item.healthScore
                }),
        _recipeUpdateAdapter = UpdateAdapter(
            database,
            'Recipe',
            ['id'],
            (Recipe item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'image': item.image,
                  'readyInMinutes': item.readyInMinutes,
                  'servings': item.servings,
                  'aggregateLikes': item.aggregateLikes,
                  'instructions': item.instructions,
                  'healthScore': item.healthScore
                }),
        _recipeDeletionAdapter = DeletionAdapter(
            database,
            'Recipe',
            ['id'],
            (Recipe item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'image': item.image,
                  'readyInMinutes': item.readyInMinutes,
                  'servings': item.servings,
                  'aggregateLikes': item.aggregateLikes,
                  'instructions': item.instructions,
                  'healthScore': item.healthScore
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Recipe> _recipeInsertionAdapter;

  final UpdateAdapter<Recipe> _recipeUpdateAdapter;

  final DeletionAdapter<Recipe> _recipeDeletionAdapter;

  @override
  Future<List<Recipe>> getAllRecipe() async {
    return _queryAdapter.queryList('SELECT * FROM Recipe',
        mapper: (Map<String, Object?> row) => Recipe(
            row['id'] as int,
            row['title'] as String,
            row['image'] as String,
            row['readyInMinutes'] as int,
            row['servings'] as int,
            row['aggregateLikes'] as int,
            row['instructions'] as String,
            row['healthScore'] as int));
  }

  @override
  Future<Recipe?> getRecipeById(int id) async {
    return _queryAdapter.query('SELECT * FROM Recipe WHERE uid=?1',
        mapper: (Map<String, Object?> row) => Recipe(
            row['id'] as int,
            row['title'] as String,
            row['image'] as String,
            row['readyInMinutes'] as int,
            row['servings'] as int,
            row['aggregateLikes'] as int,
            row['instructions'] as String,
            row['healthScore'] as int),
        arguments: [id]);
  }

  @override
  Future<void> deleteAllRecipe() async {
    await _queryAdapter.queryNoReturn('DELETE FROM Recipe');
  }

  @override
  Future<bool?> rowExists(int id) async {
    await _queryAdapter.queryNoReturn(
        'SELECT EXISTS(SELECT * FROM RecipeItem WHERE uid = ?1)',
        arguments: [id]);
  }

  @override
  Future<void> addRecipe(Recipe recipe) async {
    await _recipeInsertionAdapter.insert(recipe, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateRecipe(Recipe recipe) async {
    await _recipeUpdateAdapter.update(recipe, OnConflictStrategy.abort);
  }

  @override
  Future<void> deleteRecipe(Recipe recipe) async {
    await _recipeDeletionAdapter.delete(recipe);
  }
}
