import 'package:flutter/material.dart';
import 'package:meetup/jobs/models/job_model.dart';
import 'package:meetup/repositories/job_repository.dart';

class HomeStore with ChangeNotifier {
  final _repository = JobRepository();

  var jobs = <JobModel>[];
  String _filter = '';
  set filter(String value) {
    _filter = value;
    notifyListeners();
  }

  List<JobModel> get filteredJobs {
    if (_filter.isEmpty) {
      return jobs;
    }
    return jobs
        .where((job) =>
            job.title.toLowerCase().contains(_filter.toLowerCase()) ||
            job.description.toLowerCase().contains(_filter.toLowerCase()) ||
            job.location.toLowerCase().contains(_filter.toLowerCase()) ||
            job.tags.any(
                (tag) => tag.toLowerCase().contains(_filter.toLowerCase())))
        .toList();
  }

  init() async {
    final result = await _repository.getJobs();
    jobs = result;
    // await Future.delayed(const Duration(seconds: 5));
    // jobs = List.generate(
    //     50,
    //     (index) => JobModel(
    //           title: 'Vaga de emprego $index',
    //           location: 'Localização $index',
    //           value: 'R\$ 1.000,00',
    //           tags: ['FULL TIME', 'Remote'],
    //           description:
    //               'A plataforma de social commerce – que permite que os usuários se unam, façam grandes pedidos e obtenham descontos – recebeu US\$ 135 milhões numa extensão de sua rodada Série D, liderada pela Goodwater e Propus.',
    //           company: 'Facily',
    //           image:
    //               'https://web.faci.ly/wp-content/uploads/2023/05/logo-facily.png',
    //         ));
    notifyListeners();
  }
}
