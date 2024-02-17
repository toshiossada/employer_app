import 'package:flutter/material.dart';

import '../models/job_model.dart';
import 'widgets/jobs_tag_widget.dart';

class DetailsPage extends StatefulWidget {
  final JobModel job;

  const DetailsPage({super.key, required this.job});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  JobModel get job => widget.job;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          job.company,
          style: const TextStyle(color: Colors.white),
        ),
        backgroundColor: const Color(0xFF46A5C3),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 60),
        child: Column(
          children: [
            Image.network(job.image),
            const SizedBox(
              height: 20,
            ),
            Text(
              job.title,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            JobsTags(tags: job.tags),
            const SizedBox(height: 10),
            const Text(
              'About Job and Requirement',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  'Description: ${job.description}',
                  style: const TextStyle(color: Colors.grey),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
