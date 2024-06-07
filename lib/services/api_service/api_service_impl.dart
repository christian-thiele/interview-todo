import 'dart:math';

import 'package:uuid/v4.dart';

import 'api_service.dart';
import 'api_exception.dart';

part 'api_token.dart';

class ApiServiceImpl implements ApiService {
  final _random = Random();
  final _items = <TodoItem>[
    TodoItem(
      id: 1,
      title: 'Clean Car',
      content: 'Don\'t forget coins for the washing station.',
      createdAt: DateTime(2024, 02, 01, 09, 35),
    ),
    TodoItem(
      id: 2,
      title: 'Cook food',
      content: 'Because if you don\'t, you will starve.',
      createdAt: DateTime(2024, 02, 01, 09, 35),
    ),
    TodoItem(
      id: 3,
      title: 'Create a new javascript framework',
      content: 'Because there simply aren\'t enough.',
      createdAt: DateTime(2024, 02, 01, 09, 35),
    ),
  ];

  int _idSeq = 4;
  ApiToken? _apiToken;

  ApiServiceImpl();

  Future<void> _simulateRequest(ApiToken? token) async {
    await Future.delayed(Duration(milliseconds: _random.nextInt(3000) + 500));
    if (_random.nextInt(255) < 10) {
      throw Exception('IO Error: Network unreachable');
    }

    if (token != null && token.token != _apiToken?.token) {
      throw ApiException(
        statusCode: 401,
        message: 'Unauthorized',
      );
    }
  }

  @override
  Future<ApiToken> authenticate(String username, String password) async {
    await _simulateRequest(null);
    if (username == 'user123' && password == 'secretpassword') {
      return _apiToken = ApiToken._(
        const UuidV4().generate(),
        DateTime.timestamp(),
      );
    } else {
      throw ApiException(
          statusCode: 401, message: 'Username or password invalid.');
    }
  }

  @override
  Future<List<TodoItem>> getItems(ApiToken token, {bool? filterDone}) async {
    await _simulateRequest(token);
    if (filterDone != null) {
      return [..._items.where((item) => (item.doneAt != null) == filterDone)];
    }
    return _items;
  }

  @override
  Future<int> createItem(ApiToken token, TodoItem item) async {
    await _simulateRequest(token);
    if (_items.any((e) => e.id == item.id)) {
      throw ApiException(
          statusCode: 400, message: 'Item with id ${item.id} already exists.');
    }

    final persistedItem = item.copyWith(id: _idSeq++);
    _items.add(persistedItem);
    return persistedItem.id;
  }

  @override
  Future<void> deleteItem(ApiToken token, int itemId) async {
    await _simulateRequest(token);
    final index = _items.indexWhere((e) => e.id == itemId);
    if (index < 0) {
      throw ApiException(
        statusCode: 404,
        message: 'Item with id $itemId not found.',
      );
    }

    _items.removeAt(index);
  }

  @override
  Future<TodoItem> updateItemDone(
    ApiToken token,
    int itemId,
    bool isDone,
  ) async {
    await _simulateRequest(token);
    final index = _items.indexWhere((e) => e.id == itemId);
    if (index < 0) {
      throw ApiException(
        statusCode: 404,
        message: 'Item with id $itemId not found.',
      );
    }

    return _items[index] = _items[index].copyWith(
      doneAt: isDone ? DateTime.timestamp() : null,
      nullDoneAt: !isDone,
    );
  }
}
