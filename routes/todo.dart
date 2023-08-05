import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';

import '../vo/vo_todo.dart';

List<Todo> todoList = [];

Future<Response> onRequest(RequestContext context) async {
  final request = context.request;
  final method = request.method;

  switch (method) {
    case HttpMethod.get:
      return Response(
        body: json.encode(
          todoList.map((e) => e.toJson()).toList(),
        ),
      );
    case HttpMethod.post:
      final todo = await getTodo(request);
      todoList.add(todo);

    case HttpMethod.put:
      final todo = await getTodo(request);
      final savedTodo = todoList.firstWhere((element) => element.id == todo.id);
      savedTodo.update(todo);

    case HttpMethod.delete:
      final body = await request.body();
      final id = int.parse(body);
      todoList.removeWhere((element) => element.id == id);

    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.head:
      return Response(statusCode: 500, body: "{error 발생}");
  }

  return Response(body: 'This is a new route!');
}

Future<Todo> getTodo(Request request) async {
  final body = await request.body();
  final todo = Todo.fromJson(json.decode(body) as Map<String, Object?>);
  return todo;
}
