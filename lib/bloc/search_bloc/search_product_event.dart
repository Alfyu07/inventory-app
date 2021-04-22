part of 'search_product_bloc.dart';

class SearchAssetEvent extends Equatable {
  final String query;
  const SearchAssetEvent(this.query);

  @override
  List<Object> get props => [query];
}
