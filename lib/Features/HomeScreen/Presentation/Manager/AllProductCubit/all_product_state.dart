abstract class AllProductState {}

class AllProductInitial extends AllProductState {}

class LoadingProduct extends AllProductState {}

class SuccessFetch extends AllProductState {}

class CachedSuccess extends AllProductState {}

class ErrorFetch extends AllProductState {
  final String error;

  ErrorFetch({required this.error});
}
