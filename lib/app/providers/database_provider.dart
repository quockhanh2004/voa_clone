import 'package:flutter/material.dart';
import 'package:voa_clone/app/database/database.dart';

class DatabaseProvider extends InheritedWidget {
  final AppDatabase database;

  const DatabaseProvider({
    super.key,
    required this.database,
    required super.child,
  });

  static DatabaseProvider of(BuildContext context) {
    final DatabaseProvider? result =
        context.dependOnInheritedWidgetOfExactType<DatabaseProvider>();
    assert(result != null, 'No DatabaseProvider found in context');
    return result!;
  }

  @override
  bool updateShouldNotify(DatabaseProvider oldWidget) {
    return database != oldWidget.database;
  }
}
