library contac_lib;

import 'dart:math';

import 'package:finel_project_getx/database/Entitys/user.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:intl/intl.dart';

import 'controllers/database_controller.dart';

part 'controllers/contacts_contrller.dart';


class ContactsScreen extends GetView<ContactsController>{





  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact'
        ),
      ),

      body: Form(
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: controller.formKey,
        child: Column(

          children:
          [
            Obx(() => Expanded(
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: controller.listRx.length,
                itemBuilder:(context, index) {

                  return ListTile(
                    title: Text(controller.listRx[index].title,
                    style: TextStyle(

                      fontWeight: FontWeight.bold,

                    ),
                    ),

                    subtitle: Text(controller.listRx[index].description) ,
                    leading: Container(
                      child:  CircleAvatar(
                        radius: 35,

                        child: Text(controller.formattedDate,
                        style: TextStyle(
                          fontSize: 10
                        ),),

                      ),

                    ),

                    onTap: () {
                      controller.nameControllerUpdate.text = controller.listRx[index].title;
                      controller.phoneControllerUpdate.text = controller.listRx[index].description;
                      // nameControllerUpdate.text = '';
                      // phoneControllerUpdate.text = '';
                      int? i = controller.listRx[index].id;
                      Get.bottomSheet(
                          isScrollControlled: true,
                          enterBottomSheetDuration: Duration(milliseconds: 500),
                          SingleChildScrollView(
                            child: Container(
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),

                                ),

                              ),
                              child: Column(
                                children:
                                [

                                  SizedBox(
                                    height: 30,
                                  ),
                                  Padding(

                                    padding: const EdgeInsets.all(20.0),


                                    child: TextFormField(


                                      controller:controller.nameControllerUpdate,

                                      decoration: const InputDecoration(

                                        border: OutlineInputBorder(),
                                        label: Text('Name'),
                                      ),

                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: TextFormField(
                                      controller: controller.phoneControllerUpdate,
                                      keyboardType: TextInputType.number,
                                      validator: (value) {
                                        if(controller.nameController.text.isEmpty){
                                          return ' enter naem';
                                        }
                                      },


                                      decoration: const InputDecoration(
                                        border: OutlineInputBorder(),
                                        label: Text('Phone'),


                                      ),

                                    ),
                                  ),

                                  Padding(
                                    padding: const EdgeInsets.all(20.0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 55,
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius: BorderRadius.circular(200)

                                      ),
                                      child: MaterialButton(onPressed: () {




                                        String name = controller.nameControllerUpdate.text;
                                        String phone = controller.phoneControllerUpdate.text;
                                        controller.updateUser(i!,name,phone);
                                        Navigator.pop(context);


                                      },
                                        child: const Text('Sava',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold
                                          ),
                                        ),
                                      ),


                                    ),
                                  ),

                                ],
                              ),

                            ),
                          ),
                          elevation: 5


                      );

                    },
                    onLongPress: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: const Text('Delete User'),
                            actions: [
                              MaterialButton(
                                onPressed: () {
                                  controller.deleteUser(controller.listRx[index]);
                                  Navigator.of(context).pop();
                                },
                                child: const Text('Delete',
                                style: TextStyle(
                                  color: Colors.red
                                ),
                                ),
                              ),
                              MaterialButton(onPressed: () {
                                Navigator.of(context).pop();

                              },
                              child: Text('Close'),

                              ),
                            ],
                          );
                        },
                      );
                    },
                  );

                },

              ),
            ))

          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showBottomSheet(context);

        },
        child: const Icon(Icons.edit),

      ),


    );
    }
    void showBottomSheet(BuildContext context)
    {
      controller. nameController.text = '';
      controller. phoneController.text = '';


      Get.bottomSheet(
          isScrollControlled: true,
          enterBottomSheetDuration: Duration(milliseconds: 500),

          SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),

                ),

              ),
              child: Column(
                children:
                [

                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      controller:controller.nameController,


                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        label: Text('Name'),
                      ),

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      
                      controller: controller.phoneController,

                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),

                        label: Text('Phone'),


                      ),

                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      width: double.infinity,
                      height: 55,
                      decoration: BoxDecoration(
                          color: Colors.red,
                          borderRadius: BorderRadius.circular(200)

                      ),
                      child: MaterialButton(onPressed: () {



                       if(controller.nameController.text.isEmpty && controller.phoneController.text.isEmpty){
                         // print('hhhhhhh');
                         // controller.chec();
                         Fluttertoast.showToast(
                           msg: "These fields are required",
                           toastLength: Toast.LENGTH_SHORT,
                           gravity: ToastGravity.TOP,
                           backgroundColor: Colors.grey[600],
                           textColor: Colors.white,
                           fontSize: 16.0,
                         );
                       }else{

                         String name = controller.nameController.text;
                         String phone = controller.phoneController.text;
                         controller.inserNewUser(name,phone);
                         Navigator.pop(context);

                       }


                      },
                        child: const Text('Sava',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      ),


                    ),
                  ),

                ],
              ),

            ),
          ),
          elevation: 5


      );

    }


}
