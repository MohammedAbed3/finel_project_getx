

import 'dart:async';

import 'package:finel_project_getx/database/Entitys/user.dart';
import 'package:finel_project_getx/database/daos/hotel_dao.dart';
import 'package:finel_project_getx/database/daos/user_dao.dart';
import 'package:floor/floor.dart';

import 'package:sqflite/sqflite.dart' as sqflite;

import 'Entitys/hotel.dart';

part 'database.g.dart';

@Database(version: 2, entities: [User,Hotel])
abstract class AppDatabase extends FloorDatabase {
  UserDao get userDao;
  HotelDeo get hotelDao;
}