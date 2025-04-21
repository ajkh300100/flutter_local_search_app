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
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              onSubmitted: (query) {
                if (query.isNotEmpty) {
                  ref.read(locationProvider.notifier).searchLocations(query);
                }
              },
              decoration: const InputDecoration(
                hintText: '검색할 지역 이름을 입력하세요',
                border: OutlineInputBorder(),
                contentPadding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              ),
            ),
            const SizedBox(height: 16), // 검색창과 ListView 사이의 여백 추가
            Expanded(
              child: ListView.builder(
                itemCount: locationList.length,
                itemBuilder: (context, index) {
                  final location = locationList[index];
                  return ListTile(
                    title: Text(location.name),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(location.category),
                        Text(location.roadAddress),
                      ],
                    ),
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
            ),
          ],
        ),
      ),
    );
  }
}
