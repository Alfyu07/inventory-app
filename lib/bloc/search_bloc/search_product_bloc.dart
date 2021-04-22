import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:inventory_app/models/models.dart';
import 'package:inventory_app/services/services.dart';

part 'search_product_event.dart';
part 'search_product_state.dart';

class SearchAssetBloc extends Bloc<SearchAssetEvent, SearchAssetState> {
  SearchAssetBloc() : super(SearchAssetInitial());

  @override
  Stream<SearchAssetState> mapEventToState(SearchAssetEvent event) async* {
    ApiReturnValue<List<Asset>> result;

    try {
      yield SearchAssetLoading();

      result = await AssetServices.search(event.query);

      if (result.value != null) {
        yield SearchAssetLoaded(assets: result.value);
      } else {
        yield SearchAssetError(result.message);
      }
    } catch (e) {
      yield SearchAssetError(e.message);
    }
  }
}
