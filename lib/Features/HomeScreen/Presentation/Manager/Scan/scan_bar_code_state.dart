
abstract class ScanBarCodeState {}

class ScanBarCodeInitial extends ScanBarCodeState {}
class ChangeState1 extends ScanBarCodeState {}
class ScanBarCodeScanned extends ScanBarCodeState {
  final String barcode;

  ScanBarCodeScanned(this.barcode);
}

class ScanBarCodeError extends ScanBarCodeState {
  final String errorMessage;

  ScanBarCodeError(this.errorMessage);
}