part of 'asset_cubit.dart';

abstract class AssetState extends Equatable {
  const AssetState();

  @override
  List<Object> get props => [];
}

class AssetInitial extends AssetState {}

class AssetLoaded extends AssetState {
  final List<Asset> assets;
  bool hasReachedMax = false;
  AssetLoaded({this.assets, this.hasReachedMax});

  AssetLoaded copyWith({List<Asset> assets, bool hasReachedMax}) {
    return AssetLoaded(
      assets: assets ?? this.assets,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }

  @override
  List<Object> get props => [assets];
}

class SingleAssetLoaded extends AssetState {
  final Asset asset;

  SingleAssetLoaded(this.asset);

  @override
  List<Object> get props => [asset];
}

class AssetDeleted extends AssetState {
  final String message;

  AssetDeleted(this.message);

  @override
  List<Object> get props => [message];
}

class AssetLoadingFailed extends AssetState {
  final String message;

  AssetLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
