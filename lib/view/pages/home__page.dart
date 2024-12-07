import 'package:flutter/material.dart';
import 'package:kawika_project/model/hive_datamodel.dart';
import 'package:kawika_project/view_model/home_viewmodel.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('HomePage'),
        ),
        body: Consumer<HomeViewModel>(builder: (context, homeProvider, child) {
          final data = homeProvider.data;
          if (data.isEmpty) {
            return const Center(child: const Text('No Data'));
          } else {
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  final dataa = data[index];
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Tile(dataa: dataa),
                  );
                });
          }
        }));
  }
}

class Tile extends StatelessWidget {
  const Tile({
    super.key,
    required this.dataa,
  });

  final HiveData dataa;

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade200,
            boxShadow: const [
              BoxShadow(
                  blurRadius: 2,
                  color: Colors.grey,
                  offset: Offset(2, 0),
                  spreadRadius: 3)
            ]),
        width: MediaQuery.of(context).size.width,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CircleAvatar(
                radius: 20,
                child: Icon(Icons.person),
              ),
              const SizedBox(width: 20),
              Flexible(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("ID : ${dataa.postId}"),
                    const SizedBox(height: 5),
                    Text("Name : ${dataa.name}"),
                    const SizedBox(height: 5),
                    Text("Email : ${dataa.email}"),
                    const SizedBox(height: 8),
                    Text(
                      "Desc : ${dataa.body}",
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
