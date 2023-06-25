
part of contac_lib;



class ContactsController extends GetxController{

  RxInt i=0.obs;
  final dataBaseController = Get.find<DataBaseController>();
  RxList<User> listRx = <User>[].obs;
  List<String> list = [];


  var nameController  = TextEditingController();
  var nameControllerUpdate = TextEditingController();
  var phoneController  = TextEditingController();
  var phoneControllerUpdate  = TextEditingController();


  var name  ='';
  var phone  ='';

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();



  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    nameController  =TextEditingController();
    phoneController  =TextEditingController();
  }
  @override
  void onReady() {



   Future.delayed(Duration(seconds: 1),() => getAllUser(),);

    super.onReady();
  }

  void getAllUser()async{
    dataBaseController.userDao.getAllUserStream().listen((event) {
      listRx.value = event;

    });
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    nameController.dispose();
    phoneController.dispose();
  }

  void inserNewUser(String name ,String phone,String date) {

    User user = User(
        title:name ,
        description:phone,
      date: date
    );

    dataBaseController.insertUserData(user);

  }

  void deleteUser(User user){
    dataBaseController.deleteUserData(user);


  }

  void updateUser(int id,String name ,String phone,String date){
      User user = User(
        id: id,
          title: name,
          description:phone,
          date: date

      );

      dataBaseController.updateUserData(user);
  }

  String? textValdet (String text){
    if(text.length < 6){
      return ' This feld is reqwerd';
    }
  }

  void chec (){

    final isVakided = formKey.currentState!.validate();
    if(!isVakided){
        return;
    }
    formKey.currentState!.save();
  }


}
