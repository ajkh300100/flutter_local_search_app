import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_local_search_app/viewmodels/location_viewmodel.dart';
import 'package:flutter_local_search_app/pages/detail_page.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final locationList = ref.watch(locationProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Local Search'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () async {
              final query = await showSearch<String>(
                context: context,
                delegate: CustomSearchDelegate(),
              );
              if (query != null) {
                ref.read(locationProvider.notifier).searchLocations(query);
              }
            },
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: locationList.length,
        itemBuilder: (context, index) {
          final location = locationList[index];
          return ListTile(
            title: Text(location.name),
            onTap: () {
              if (location.link.startsWith('https')) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailPage(url: location.link),
                  ),
                );
              }
            },
          );
        },
      ),
    );
  }
}

class CustomSearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, '');
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();  // 검색 결과를 바로 보여주는 위젯
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          title: Text('Suggested Search 1'),
          onTap: () {
            query = 'Suggested Search 1';
            showResults(context);
          },
        ),
        ListTile(
          title: Text('Suggested Search 2'),
          onTap: () {
            query = 'Suggested Search 2';
            showResults(context);
          },
        ),
      ],
    );
  }
}
