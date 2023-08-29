import 'package:dart_frog/dart_frog.dart';

import '../todos.dart';

final commonHeader = {'Content-Type': 'application/json'};

Future<Response> onRequest(RequestContext context, String stringId) async {
  final request = context.request;
  final method = request.method;
  final id = int.parse(stringId);

  switch (method) {
    case HttpMethod.put:
      final todo = await getTodo(request);
      final savedTodo = todoList.firstWhere((element) => element.id == id);
      print('savedTodoUpdate: ${todo.status}');
      savedTodo.update(todo);
      return Response(
        statusCode: 201,
        headers: commonHeader,
      );
    case HttpMethod.delete:
      todoList.removeWhere((element) => element.id == id);
      return Response(
        statusCode: 201,
        headers: commonHeader,
      );
    case HttpMethod.get:
    case HttpMethod.post:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.head:
      return Response(
        statusCode: 500,
        body: '{"errorMessage": "지원하지 않는 method입니다"}',
        headers: commonHeader,
      );
  }
}
