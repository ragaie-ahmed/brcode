import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterscanner/Features/HomeScreen/Presentation/Manager/Scan/scan_bar_code_state.dart';

class ScanBarCodeCubit extends Cubit<ScanBarCodeState> {
  ScanBarCodeCubit() : super(ScanBarCodeInitial());

  static ScanBarCodeCubit get(context) => BlocProvider.of(context);
  String? barcodeScanRes;


  Future<void> scanQR() async {
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
        '#ff6666', 'Cancel', true, ScanMode.BARCODE,
      );
      print("Barcode Scanned: $barcodeScanRes");
    } on PlatformException catch (e) {
      print("Error scanning barcode: $e");
      barcodeScanRes = null; // Set barcodeScanRes to null in case of an error
    }
    emit(ChangeState1());
  }

}
