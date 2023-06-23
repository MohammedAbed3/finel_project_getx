
import 'package:finel_project_getx/ContactsScreen.dart';
import 'package:finel_project_getx/app_route.dart';
import 'package:finel_project_getx/controllers/bindings.dart';
import 'package:get/get.dart';

class Pages{
  static const ContactsPage = Routes.Contacts;
  static final route = [
    GetPage(
        name: Paths.Contacts,
        page: () => ContactsScreen(),
        bindings: [
          ContactsBinding(),
        ]


    ),
  ];
}