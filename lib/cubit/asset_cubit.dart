import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_app/models/models.dart';
import 'package:inventory_app/services/services.dart';
part 'asset_state.dart';

class AssetCubit extends Cubit<AssetState> {
  AssetCubit() : super(AssetInitial());

  Future<void> getAssets() async {
    ApiReturnValue<List<Asset>> result = await AssetServices.getAssets();

    if (result.value != null) {
      emit(AssetLoaded(result.value));
    } else {
      emit(AssetLoadingFailed(result.message));
    }
  }

  Future<void> addAssets(Asset asset) async {
    ApiReturnValue<List<Asset>> result = await AssetServices.addAsset(asset);

    if (result.value != null) {
      emit(AssetLoaded(result.value));
    } else {
      emit(AssetLoadingFailed(result.message));
    }
  }

  //TODO: Filter API
  Future<void> sortAssets(value) async {
    ApiReturnValue<List<Asset>> result = await AssetServices.sortAssets(value);

    if (result.value != null) {
      emit(AssetLoaded(result.value));
    } else {
      emit(AssetLoadingFailed(result.message));
    }
  }
}
