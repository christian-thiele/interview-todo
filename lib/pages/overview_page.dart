import 'package:flutter/material.dart';

import 'package:interview_test_todo/services/api_service/api_service.dart';

class OverviewPage extends StatelessWidget {
  const OverviewPage({super.key});

  @override
  Widget build(BuildContext context) {
    final exampleItem = TodoItem(
      title: 'Example 1',
      content: 'Example description',
      createdAt: DateTime.now(),
    );

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const SliverAppBar(
            title: Text('Meine Todos'),
          ),
          SliverToBoxAdapter(
            child: Card(
              margin: const EdgeInsets.only(
                left: 16.0,
                right: 16.0,
                top: 8.0,
              ),
              clipBehavior: Clip.antiAlias,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: [
                    Checkbox(
                      value: false,
                      onChanged: (value) {},
                    ),
                    const SizedBox(width: 8.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          exampleItem.title,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          exampleItem.content,
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
