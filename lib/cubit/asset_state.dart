part of 'asset_cubit.dart';

abstract class AssetState extends Equatable {
  const AssetState();

  @override
  List<Object> get props => [];
}

class AssetInitial extends AssetState {}

class AssetLoaded extends AssetState {
  final List<Asset> assets;

  AssetLoaded(this.assets);

  @override
  List<Object> get props => [assets];
}

class AssetLoadingFailed extends AssetState {
  final String message;

  AssetLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}
