import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:pharmazool/core/utils/media_query_values.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import '../MedicineScreen.dart';
import '../../../../../../core/utils/assets_images_path.dart';
import '../../widget/search_bar.dart';

class HomeIconsModel {
  final String icon;
  final String title;
  final int id;

  HomeIconsModel({
    required this.icon,
    required this.title,
    required this.id,
  });
}

List<HomeIconsModel> HomeList = [
  HomeIconsModel(icon: painrelife, title: "painrelife", id: 1),
  HomeIconsModel(icon: antibaiotic, title: 'antibaiotic', id: 2),
  HomeIconsModel(icon: eyecare, title: 'eye care', id: 3),
  HomeIconsModel(icon: diabetesCare, title: 'diabetes care', id: 4),
  HomeIconsModel(icon: babyCare, title: 'baby care', id: 5),
  HomeIconsModel(icon: heartCare, title: 'heart care', id: 6),
];

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? scanResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // leading: IconButton(
      //   //   icon: const Icon(Icons.arrow_back_rounded),
      //   //   onPressed: () {
      //   //     Navigator.push(context,
      //   //         MaterialPageRoute(builder: (context) => const HomeScreen()));
      //   //   },
      //   // ),
      //   centerTitle: true,
      //   title: const Text(
      //     "Home",
      //   ),
      //   backgroundColor: Colors.teal,
      // ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: context.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Container(
                  height: context.height * 0.30,
                  width: context.width * 0.9,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10)),
                      image: DecorationImage(
                          image: AssetImage('assets/images/logo_11zon_low.png'),
                          fit: BoxFit.fill)),
                ),
              ),
              SizedBox(
                height: context.height * 0.01,
              ),
              SearchBar(),
              // SearchBar(ScanWidget: ScanBarCode()),
              SizedBox(
                height: context.height * 0.05,
              ),
              // BarCodeResult(),
              Container(
                color: Colors.white,
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  // crossAxisCount: 3,
                  // mainAxisSpacing: 1,
                  // crossAxisSpacing: 1,
                  // childAspectRatio: 1 / 1.7,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 2,
                    mainAxisSpacing: 8,
                    mainAxisExtent: 110,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    int TouchIndex = HomeList[index].id;
                    return HomeGridView(HomeList[index], context, TouchIndex);
                  },
                  itemCount: HomeList.length,
                  // children: List.generate(HomeList.length,
                  //     (index) => HomeGridView(HomeList[index], context)),
                ),
              ),
            ],
          ),
        ),
      ),
      extendBody: true,
    );
  }

  // Future   ScanBarCode() async {
  //   String scanResult;
  // try {
  //     scanResult = await FlutterBarcodeScanner.scanBarcode(
  //         '#ff6666', 'Cancel', true, ScanMode.BARCODE);
  //     print(
  //         "456465455555554444444444444444444444444444444444444444444444444444444444555555555555555535555554$scanResult");
  //   } on PlatformException {
  //     scanResult = "Failed To Get Platform version.";
  //     print(scanResult);
  //   } on MissingPluginException {
  //     scanResult =
  //         "No implementation found for method scanBarcode on channel flutter_barcode_scanner";
  //   }
  //   // if (context.mounted != true) return;
  //   if (mounted != true) return;

  //   setState(() {
  //     this.scanResult = scanResult;
  //     // ShowToust(Text: scanResult, state: ToustStates.SUCSESS);
  //     // Fluttertoast.showToast(
  //     //     msg: "This is Center Short Toast",
  //     //     toastLength: Toast.LENGTH_SHORT,
  //     //     gravity: ToastGravity.CENTER,
  //     //     timeInSecForIosWeb: 1,
  //     //     backgroundColor: Colors.red,
  //     //     textColor: Colors.white,
  //     //     fontSize: 16.0);
  //   });
  //   //
  // }

}

HomeGridView(
    HomeIconsModel homeIconModel, BuildContext context, int TouchIndex) {
  return InkWell(
    onTap: () {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MedicineScreen(
                    TouchIndex: TouchIndex,
                    homeIconsModel: homeIconModel,
                  )));
    },
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        color: Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            homeIconModel.icon,
            height: context.height * 0.1,
            width: context.height * 0.1,
          ),
          SizedBox(
            height: context.height * 0.0035,
          ),
          Container(
            child: AutoSizeText(
              homeIconModel.title,
              style: TextStyle(
                  color: Colors.black,
                  // fontSize: context.height * 0.017,
                  fontSize: 18,
                  fontStyle: FontStyle.normal,
                  fontFamily: 'Schyler'),
            ),
          )
        ],
      ),
    ),
  );
}

 
// class BarCodeResult extends StatefulWidget {
//   const BarCodeResult({
//     super.key,
//   });

//   @override
//   State<BarCodeResult> createState() => _BarCodeResultState();
// }

// class _BarCodeResultState extends State<BarCodeResult> {
//   @override
//   String? scanResult;
//   Widget build(BuildContext context) {
//     return Text('Result:${scanResult}');
//   }

//   Future ScanBarCode() async {
//     String scanResult;
//     try {
//       scanResult = await FlutterBarcodeScanner.scanBarcode(
//           '#ff6666', 'Cancel', true, ScanMode.BARCODE);
//       print(
//           "456465455555554444444444444444444444444444444444444444444444444444444444555555555555555535555554$scanResult");
//     } on PlatformException {
//       scanResult = "Failed To Get Platform version.";
//       print(scanResult);
//     } on MissingPluginException {
//       scanResult =
//           "No implementation found for method scanBarcode on channel flutter_barcode_scanner";
//     }
//     // if (context.mounted != true) return;
//     // if (mounted != true) return;

//     setState(() {
//       this.scanResult = scanResult;
//       // ShowToust(Text: scanResult, state: ToustStates.SUCSESS);
//       // Fluttertoast.showToast(
//       //     msg: "This is Center Short Toast",
//       //     toastLength: Toast.LENGTH_SHORT,
//       //     gravity: ToastGravity.CENTER,
//       //     timeInSecForIosWeb: 1,
//       //     backgroundColor: Colors.red,
//       //     textColor: Colors.white,
//       //     fontSize: 16.0);
//     });
//     //
//   }

// }
