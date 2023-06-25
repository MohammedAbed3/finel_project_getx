
import 'package:finel_project_getx/ContactsScreen.dart';
import 'package:finel_project_getx/HotelScreen.dart';
import 'package:finel_project_getx/ShowHotel.dart';
import 'package:finel_project_getx/app_route.dart';
import 'package:finel_project_getx/controllers/bindings.dart';
import 'package:get/get.dart';

import 'AddHotelScreen.dart';

class Pages{
  static const ContactsPage = Routes.Contacts;
  static const HotelPage = Routes.HotelScreen;
  static final route = [
    GetPage(
        name: Paths.Contacts,
        page: () => ContactsScreen(),
        bindings: [
          ContactsBinding(),
        ]


    ),

    GetPage(
        name: Paths.HotelScreen,
        page: () => HotelScreen(),
      bindings: [
        HotelBinding(),
        AddHotelBinding()
      ]
    ),

    GetPage(
        name: Paths.ShowHotel,
        page: () => ShowHotel(),
        bindings: [
          ShowHotelBinding()
        ]
    ),

    GetPage(
        name: Paths.AddHotelScreen,
        page: () => AddHotelScreen(),
        bindings: [
          AddHotelBinding()
        ]
    ),
  ];
}