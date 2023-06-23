

import 'dart:async';

import 'package:finel_project_getx/database/Entitys/user.dart';
import 'package:finel_project_getx/database/daos/user_dao.dart';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [User])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
}