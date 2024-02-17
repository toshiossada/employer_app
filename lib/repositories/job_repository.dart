import 'package:dio/dio.dart';
import 'package:meetup/jobs/models/job_model.dart';

class JobRepository {
  final client = Dio();

  Future<List<JobModel>> getJobs() async {
    try {
      final response = await client.get('http://10.0.2.2:3001/jobs');
      return (response.data['jobs'] as List)
          .map((e) => JobModel.fromMap(e))
          .toList();
    } catch (e) {
      print(e);
      return [];
    }
  }
}
