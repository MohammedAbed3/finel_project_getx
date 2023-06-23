
import 'package:finel_project_getx/database/Entitys/user.dart';
import 'package:floor/floor.dart';

@dao
abstract class UserDao{

  @insert
  Future<void> insertUserData(User user);

  @update
  Future<void> updateUserData(User user);

  @delete
  Future<void> deleteUserData(User user);

  @Query('SELECT * FROM User')
  Future<List<User>> getAllUser();

  @Query('SELECT * FROM User WHERE id = :id')
  Future<User?> getUserById(int id);

  @Query('SELECT * FROM User')
  Stream<List<User>> getAllUserStream();

  @Query('SELECT * FROM User WHERE id = :id')
  Stream<List<User>> getUserByIdStream(int id);


}