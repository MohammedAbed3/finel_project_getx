

import 'package:finel_project_getx/ContactsScreen.dart';
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

