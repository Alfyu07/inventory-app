part of 'widgets.dart';

class AssetSearch extends SearchDelegate<Asset> {
  @override
  List<Widget> buildActions(BuildContext context) => null;

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: BackButtonIcon(),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return BlocProvider(
        create: (context) => SearchAssetBloc()..add(SearchAssetEvent(query)),
        child: BlocBuilder<SearchAssetBloc, SearchAssetState>(
          builder: (BuildContext context, SearchAssetState state) {
            if (state is SearchAssetLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is SearchAssetError) {
              return Container(
                child: Text(state.message),
              );
            }
            if (state is SearchAssetInitial) {
              return Container();
            }

            SearchAssetLoaded searchLoaded = state as SearchAssetLoaded;

            return ListView.builder(
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Icon(Icons.location_city),
                  title: Text(searchLoaded.assets[index].name),
                  onTap: () => close(context, searchLoaded.assets[index]),
                );
              },
              itemCount: searchLoaded.assets.length,
            );
          },
        ));
  }

  @override
  Widget buildSuggestions(BuildContext context) => Container();
}
