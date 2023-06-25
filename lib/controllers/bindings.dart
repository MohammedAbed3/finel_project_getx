

import 'package:finel_project_getx/AddHotelScreen.dart';
import 'package:finel_project_getx/ContactsScreen.dart';
import 'package:finel_project_getx/HotelScreen.dart';
import 'package:finel_project_getx/ShowHotel.dart';
import 'package:finel_project_getx/controllers/database_controller.dart';
import 'package:get/get.dart';

class ContactsBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<ContactsController>(()=>ContactsController());


  }

}
class DataBaseBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<DataBaseController>(()=>DataBaseController());


  }

}


  class HotelBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<HotelController>(()=>HotelController());


  }

}

class ShowHotelBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<ShowHotelController>(()=>ShowHotelController());


  }

}

class AddHotelBinding extends Bindings{
  @override
  void dependencies() {

    Get.lazyPut<AddHotelController>(()=>AddHotelController());


  }

}


