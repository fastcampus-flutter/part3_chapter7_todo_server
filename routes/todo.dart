import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';

import '../vo/vo_todo.dart';

Response onRequest(RequestContext context) {
  final request = context.request;
  final method = request.method;

  switch (method) {
    case HttpMethod.get:
      return Response(
        body: json.encode(
          [
            Todo(id: 123, title: 'wow', dueDate: DateTime.now()).toJson(),
          ],
        ),
      );
    case HttpMethod.put:
    case HttpMethod.post:
    case HttpMethod.delete:
    case HttpMethod.options:
    case HttpMethod.patch:
    case HttpMethod.head:
      return Response(statusCode: 500, body: "{error 발생}");
  }

  return Response(body: 'This is a new route!');
}
