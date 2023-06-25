
import 'package:finel_project_getx/database/Entitys/hotel.dart';
import 'package:finel_project_getx/database/Entitys/user.dart';
import 'package:finel_project_getx/database/daos/hotel_dao.dart';
import 'package:finel_project_getx/database/daos/user_dao.dart';
import 'package:finel_project_getx/database/database.dart';
import 'package:get/get.dart';

class DataBaseController extends GetxController{

  late UserDao userDao;
  late HotelDeo hotelDao;

  @override
  void onInit() {
    createOrOpenDataBase();

    super.onInit();
  }

  createOrOpenDataBase() async{

    final database = await $FloorAppDatabase.databaseBuilder('user_database.db').build();

    userDao = database.userDao;
    hotelDao = database.hotelDao;
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void insertUserData(User user) {
    userDao.insertUserData(user);
  }
  void updateUserData(User user) {
    userDao.updateUserData(user);
  }
  void deleteUserData(User user) {
    userDao.deleteUserData(user);
  }

  Future<User?> getUserById(int id)async{
    return await userDao.getUserById(id);

  }

  void insertHotel(Hotel hotel) {
    hotelDao.insertHotel(hotel);
  }
  void updateHotel(Hotel hotel) {
    hotelDao.updateHotel(hotel);
  }
  void deleteHotel(Hotel hotel) {
    hotelDao.deleteHotel(hotel);
  }

}