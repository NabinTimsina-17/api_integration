import 'package:api_integration/Model/get_model.dart';
import 'package:api_integration/Services/get_services.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CommandsModel> commandsModel = [];
  getComments() {
    GetApiServices().getCommentsModel().then((value) {
      setState(() {
        commandsModel = value!;
      });
    });
  }

  @override
  void initState() {
    getComments();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Get API Data",
        ),
      ),
      body: ListView.builder(
          shrinkWrap: true,
          itemCount: commandsModel.length,
          itemBuilder: (context, index) {
            final apidata = commandsModel[index];
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Material(
                color: Colors.blue[100],
                elevation: 5,
                borderRadius: BorderRadius.circular(20),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 3,
                    ),
                    CircleAvatar(
                      backgroundColor: Colors.blue[200],
                      child: Text(apidata.id.toString(),
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          )),
                    ),
                    SizedBox(
                     
                      width: MediaQuery.of(context).size.width / 1.175,
                      child: Column(
                        
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            apidata.name.toString(),
                            maxLines: 1,
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Text(
                            apidata.email.toString(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 22),
                          ),
                          Text(
                            apidata.body.toString(),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          }),
    );
  }
}
