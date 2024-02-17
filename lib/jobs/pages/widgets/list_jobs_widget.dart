import 'package:flutter/material.dart';

import '../../models/job_model.dart';
import 'jobs_tag_widget.dart';

class ListJobsWidget extends StatelessWidget {
  final List<JobModel> jobs;
  final Function(JobModel) onTap;
  const ListJobsWidget({
    super.key,
    required this.jobs,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: jobs.length,
      itemBuilder: (context, index) {
        final job = jobs[index];
        return Column(
          children: [
            Card(
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Image.network(
                        job.image,
                        fit: BoxFit.fill,
                      ),
                    ),
                    title: Text(job.title),
                    subtitle: Text('${job.company} - ${job.location}'),
                    trailing: Text(job.salary),
                    onTap: () => onTap(job),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: JobsTags(tags: job.tags),
                  ),
                ],
              ),
            ),
            const Divider(),
          ],
        );
      },
    );
  }
}
