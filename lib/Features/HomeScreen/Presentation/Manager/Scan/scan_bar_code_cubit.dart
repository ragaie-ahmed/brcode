import 'package:Alaqsa/Features/HomeScreen/Presentation/Manager/Scan/scan_bar_code_state.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ScanBarCodeCubit extends Cubit<ScanBarCodeState> {
  ScanBarCodeCubit() : super(ScanBarCodeInitial());

  static ScanBarCodeCubit get(context) => BlocProvider.of(context);

  Future<void> scanBarcode() async {
    try {
      String barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      print("Barcode Scanned: $barcodeScanRes");
      emit(ScanBarCodeScanned(barcodeScanRes));
    } on PlatformException catch (e) {
      print("Error scanning barcode: $e");
      emit(ScanBarCodeError("Error scanning barcode: $e"));
    }
  }
}