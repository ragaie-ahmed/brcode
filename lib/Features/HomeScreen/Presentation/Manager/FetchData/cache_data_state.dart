
abstract class CacheDataState {}

class CacheDataInitial extends CacheDataState {}
class CacheSuccess extends CacheDataState {}
class ErrorSearch extends CacheDataState {
  final String error;

  ErrorSearch({required this.error});
}