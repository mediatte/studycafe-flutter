import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Model/product.dart';
import '../../../logic/controllers/prodect_controller.dart';
import '../../widgets/admin/Add_Product_Widgets/text_field_product.dart';
import '../../widgets/admin/Add_Product_Widgets/text_utils.dart';

class CafeDetails extends StatefulWidget {
  final Prodect products;

  CafeDetails({Key? key, required this.products}) : super(key: key);

  CafeDetailsState createState() => CafeDetailsState();
}
class CafeDetailsState extends State<CafeDetails>{

  final controller = Get.find<ProdectController>();

  // final controller = Get.find<AddProductController>();
  final myKey = GlobalKey<FormState>();

  int _currentValue = 3;
  DateTime currentDate = DateTime.now();
  @override
  Widget build(BuildContext context) {

    var s = null.obs;
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        leading: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text("Cancel",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w400)),
        ),
        title: Text(
          widget.products.productName,
          style: TextStyle(
              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700),
        ),
        // titleSpacing: 50,
        centerTitle: true,

        actions: [
          GetBuilder<ProdectController>(builder: (_) {
            return TextButton(
              onPressed: (){},
              child: Text(
                "Book",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400),
              ),
            );
          })
        ],
        elevation: 0,
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 16, right: 16, top: 56),
          child: Form(
            key: myKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Container(
                  height: 206,
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(4),
                      image: DecorationImage(
                          image: NetworkImage(
                              '${widget.products.imageUrl}'),
                          fit: BoxFit.fill)),
                ),
                SizedBox(
                  height: 16,
                ),
                TextUtils(
                  text: 'Details',
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  widget.products.description
                ),
                SizedBox(
                  height: 16,
                ),
                TextUtils(
                  text: 'number of people',
                ),
                SizedBox(
                  height: 8,
                ),

            
                SizedBox(
                  height: 16,
                ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
          children:[
          NumberPicker(
            value: _currentValue,
            minValue: 0,
            maxValue: 100,
            onChanged: (value) => setState(() => _currentValue = value),
          ),
            ]),

                SizedBox(
                  height: 8,
                ),
                TextUtils(
                  text: 'Date',
                ),
                SizedBox(
                  height: 8,
                ),
                TextButton(onPressed: () => _selectDate(context), child: Text(currentDate.toString().substring(0,10))),
                // DatePickerDialog(initialDate: DateTime(2022), firstDate: DateTime(2000), lastDate: DateTime(2025)),
                SizedBox(
                  height: 16,
                ),
                TextUtils(
                  text: 'Price',
                ),
                SizedBox(
                  height: 8,
                ),
                Text((widget.products.price*_currentValue).toString()),
                SizedBox(
                  height: 25,

                ),
                Row(
                  children: [
                    TextUtils(
                      text: 'Location',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    IconButton(
                      onPressed: (){
                        _launchURL(widget.products.location.toString());
                      },
                      icon:Icon(Icons.location_on_outlined),
                    ),
                  ],
                ),

                SizedBox(
                  height: 15,
                ),


              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(2015),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;
      });
  }

  _launchURL(String s) async {
    final uri = Uri.parse(s);
  if (await canLaunchUrl(uri)) {
  await launchUrl(uri);
  } else {
  throw 'Could not launch $s';
  }
}
}
