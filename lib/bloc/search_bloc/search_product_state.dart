part of 'search_product_bloc.dart';

abstract class SearchAssetState extends Equatable {
  const SearchAssetState();

  @override
  List<Object> get props => [];
}

class SearchAssetInitial extends SearchAssetState {}

class SearchAssetLoaded extends SearchAssetState {
  final List<Asset> assets;
  SearchAssetLoaded({this.assets});

  @override
  List<Object> get props => [assets];

  SearchAssetLoaded copyWith({List<Asset> assets, bool hasReachedMax}) =>
      SearchAssetLoaded(assets: assets ?? this.assets);
}

class SearchAssetLoading extends SearchAssetState {}

class SearchAssetError extends SearchAssetState {
  final String message;

  SearchAssetError(this.message);
  @override
  List<Object> get props => [message];
}
