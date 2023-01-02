import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:librarybook/Views/Screens/user/customer_home.dart';

import '../../../Model/product.dart';
import '../../../Views/widgets/side_bar_menu.dart';
import '../../../logic/controllers/prodect_controller.dart';
import '../../../routes.dart';
import '../../widgets/SearchProducts.dart';
import '../../widgets/user/cart_item_customer.dart';
import '../../widgets/user/favourites/prodects_favourites.dart';

class CustomerHome extends StatefulWidget {
  CustomerHome({Key? key}) : super(key: key);
  CustomerHomeState createState() => CustomerHomeState();

}
class CustomerHomeState extends State<CustomerHome>{
  final controller = Get.put(ProdectController());
  TextEditingController searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      appBar: AppBar(
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: 145,
        iconTheme: IconThemeData(color: Colors.black),
        title:

        Container(
            //margin: EdgeInsets.only(top: 20),
            child: TextField(
              controller: searchTextController,
              cursorColor: Colors.black,
              keyboardType: TextInputType.text,
              onChanged: (searchName) {
                setState(() {
                  controller.addSearchToList(searchName);

                });

              },
              decoration: InputDecoration(
                fillColor: Colors.white,
                focusColor: Colors.red,
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
                hintText: "Search Cafe",
                hintStyle: const TextStyle(
                  color: Colors.black45,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.black45),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )),
        elevation: 0,
        centerTitle: true,
        actions: [

          IconButton(
            onPressed: () {
              print(controller.favouritesList);
              Get.toNamed(Routes.profileScreen);
            },
            icon: Icon(
              Icons.supervised_user_circle_rounded,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          StreamBuilder(
            stream: controller.getData,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                controller.prodects = snapshot.data!.docs
                    .map((e) => Prodect(
                        productNumber: e['productNumber'],
                        productName: e['productName'],
                        category: e['category'],
                        quantity: e['quantity'],
                        price: e['price'],
                        description: e['description'],
                        imageUrl: e['imageUrl'],
                location:e['location']))
                    .toList();
                  controller.addSearchToList("");
                if (controller.prodects.isNotEmpty) {
                  return CardItem(prodects: controller.prodectsFavourites);
                } else {
                  return Text("No thing");
                }
              } else {
                return CardItem(prodects: controller.prodectsFavourites);
              }
            },
          ),
        ],
      ),
        );
  }
}
