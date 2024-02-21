abstract class SearchProductState {}

class SearchProductInitial extends SearchProductState {}

class LoadingSearch extends SearchProductState {}

class SuccessSearch extends SearchProductState {}

class CacheSuccess extends SearchProductState {}
class ErrorSsearch extends SearchProductState {}
class ErrorCache extends SearchProductState {}

class ErrorSearch extends SearchProductState {
  final String error;

  ErrorSearch({required this.error});
}
