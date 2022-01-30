import 'package:flutter/material.dart';
import 'package:flutter_demo/response/todo_response.dart';
import 'package:dio/dio.dart';

class ApiDataPage extends StatefulWidget {
  const ApiDataPage({Key? key, this.data}) : super(key: key);
  final String? data;

  @override
  _ApiDataPageState createState() => _ApiDataPageState();
}

class _ApiDataPageState extends State<ApiDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${widget.data}'),
      ),
      body: FutureBuilder<List<TodoResponse>>(
        future: callTodoApi(),
        builder: (context, snapshot) {
          if(snapshot.connectionState == ConnectionState.done){
            if(snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                        leading: const Icon(Icons.list),
                        trailing: Text("${snapshot.data?[index].id ?? ''}",
                          style: const TextStyle(
                              color: Colors.green, fontSize: 15),),
                        title: Text("${snapshot.data?[index].title}")
                    );
                  }
              );
            }
            return const Center(
              child: Text("No data found."),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      ),
    );
  }

  Future<List<TodoResponse>> callTodoApi() async {
    var dio = Dio();
    final response = await dio.get('https://jsonplaceholder.typicode.com/todos');
    List<TodoResponse> list=[];
    //TODO removed below comment, if we want to set more waiting in api response.
   // await  Future.delayed(Duration(seconds: 2));
    for(int i=0;i<response.data.length;i++){
      list.add(TodoResponse(id: response.data[i]["id"],
          title: response.data[i]["title"],
          userId: response.data[i]["userId"],
        completed: response.data[i]["completed"],
      ));
    }
    return list;
  }
}
