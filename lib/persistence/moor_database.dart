
import 'package:gymapp/persistence/table_entries.dart';
import 'package:moor_flutter/moor_flutter.dart';
part 'moor_database.g.dart';

@DataClassName("Category")
class Categories extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  
}

class Exercises extends Table{
  IntColumn get id => integer().autoIncrement()();
  TextColumn get title => text()();
  IntColumn get category => integer()();
}

@UseMoor(tables: [Categories, Exercises])
class GymDatabase extends _$GymDatabase{
  GymDatabase()
      : super(FlutterQueryExecutor.inDatabaseFolder(
        path: "db.sqlite", logStatements: true));

  @override
  int get schemaVersion => 1;


  @override
  MigrationStrategy get migration =>MigrationStrategy(
    onCreate: (Migrator m){
      return m.createAll();
    },
    
    beforeOpen: (details) async{
      /*final m = Migrator(this);
        for (final table in allTables) {
          await m.deleteTable(table.actualTableName);
          await m.createTable(table);
        }*/
      if(details.wasCreated){
        TableEntries.defaultCategories.forEach((element) async {
          await into(categories).insert(Category(id: null, title: element));
        });
        TableEntries.legs.forEach((element) async{
         await into(exercises).insert(Exercise(id: null, title: element, category: 1));
        });TableEntries.back.forEach((element) async{
         await into(exercises).insert(Exercise(id: null, title: element, category: 2));
        });
      }


    }

  );


  Future<List<Category>> getAllCategories() => select(categories).get();
  Stream<List<Category>> watchAllCategories() => select(categories).watch();
  Future insertCategory(Category category) => into(categories).insert(category);
  Future updateCategory(Category category) => update(categories).replace(category);
  Future deleteCategory(Category category) => delete(categories).delete(category);

  Future<List<Exercise>> getAllExercises() => select(exercises).get();
  Stream<List<Exercise>> watchAllExercises() => select(exercises).watch();
  Future insertExercise(Exercise exercise) => into(exercises).insert(exercise);
  Future updateExercise(Exercise exercise) => update(exercises).replace(exercise);
  Future deleteExercise(Exercise exercise) => delete(exercises).delete(exercise);

  Future<List<Exercise>> getExerciseByCategory(Category c){
    return (select(exercises)..where((e) => e.category.equals(c.id))).get();
  }


}

