import 'package:flutter/material.dart';

import '../stores/home_store.dart';
import 'details_page.dart';
import 'widgets/app_bar_widget.dart';
import 'widgets/list_jobs_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final store = HomeStore();

  @override
  void initState() {
    super.initState();
    store.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppBarWidget(
          onSearch: (value) {
            store.filter = value;
          },
        ),
        const SizedBox(
          height: 40,
        ),
        const Padding(
          padding: EdgeInsets.all(8.0),
          child: Text(
            'Vagas mais Recentes',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
        const Divider(),
        Expanded(
            child: ListenableBuilder(
          listenable: store,
          builder: (_, widget) {
            if (store.jobs.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListJobsWidget(
              jobs: store.filteredJobs,
              onTap: (job) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DetailsPage(
                      job: job,
                    ),
                  ),
                );
              },
            );
          },
        ))
      ],
    ));
  }
}
