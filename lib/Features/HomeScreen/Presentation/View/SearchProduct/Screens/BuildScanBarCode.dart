import 'package:Alaqsa/Core/utils/Shared_pref.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/FetchData/cache_data_cubit.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/Login/Screens/Login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:Alaqsa/Features/HomeScreen/Presentation/View/SearchProduct/Screens/DetailsSearch.dart';
class BuildScan extends StatefulWidget {
  const BuildScan({Key? key}) : super(key: key);

  @override
  State<BuildScan> createState() => _BuildScanState();
}

class _BuildScanState extends State<BuildScan> {
  String result = "";

  @override
  void initState() {
    CacheDataCubit.get(context).fetchAndCacheProducts();
    super.initState();
  }

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
        title: const Text("مسح الباركود", style: TextStyle(fontSize: 22)),
        centerTitle: true,
      ),
      drawer: Drawer(
        // Your drawer content goes here
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Center(
                  child: Text(
                'صفحه البروفايل ',
                style: TextStyle(color: Colors.white),
              )),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            SizedBox(
              height: 200,
            ),
            ListTile(
              title: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20)),
                child: InkWell(
                  onTap: () async {
                    await SharedPref.deleteData(key: "userid");
                    Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return LogIn();
                        },
                      ),
                      (route) => false,
                    );
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'تسجيل الخروج',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.exit_to_app,
                        color: Colors.white,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: ElevatedButton(
              onPressed: () async {
                try {
                  String barcodeScanRes =
                      await FlutterBarcodeScanner.scanBarcode(
                    '#ff6666',
                    'Cancel',
                    true,
                    ScanMode.BARCODE,
                  );

                  if (barcodeScanRes != '-1' &&
                      barcodeScanRes.length > 0 &&
                      barcodeScanRes.length <= 50) {
                    setState(() {
                      result = barcodeScanRes;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsSearch(barcode: result),
                      ),
                    );
                  }
                } catch (e) {
                  print("Error scanning barcode: $e");
                }
              },
              child: const Text(
                'فتح الماسح الضوئي',
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
