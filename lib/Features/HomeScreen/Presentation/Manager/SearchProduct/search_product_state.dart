

import 'package:flutterscanner/Features/HomeScreen/data/Model/Searchproduct.dart';

abstract class SearchProductState {}

class SearchProductInitial extends SearchProductState {}
class LoadingSearch extends SearchProductState {}
class ChangeState1 extends SearchProductState {}
class SuccessSearch extends SearchProductState {}
class ChangeState extends SearchProductState {}
class ErrorSearch extends SearchProductState{
  final String error;

  ErrorSearch({required this.error});

}
