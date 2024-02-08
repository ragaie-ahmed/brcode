import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/Manager/Scan/scan_bar_code_state.dart';

class ScanBarCodeCubit extends Cubit<ScanBarCodeState> {
  ScanBarCodeCubit() : super(ScanBarCodeInitial());

  static ScanBarCodeCubit get(context) => BlocProvider.of(context);
  String? scanBarcode;


  Future<void> scanQR() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }

    scanBarcode = barcodeScanRes;
  }

}
