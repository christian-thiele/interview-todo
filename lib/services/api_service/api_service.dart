import 'api_service_impl.dart';
import 'todo_item.dart';

export 'todo_item.dart';
export 'api_service_impl.dart';

/// This service provides methods to call endpoints at our API.
///
/// All methods throw an [ApiException] in the case of faulty status codes.
///
/// Of course, this is just a mockup.
abstract class ApiService {
  factory ApiService() => ApiServiceImpl();

  /// Authenticates the user and returns the access token when successful.
  ///
  /// Valid login:
  ///   username: user123
  ///   password: secretpassword
  Future<ApiToken> authenticate(String username, String password);

  /// Fetches [TodoItem]s.
  ///
  /// [filterDone] filters for done (true / false) if not null
  Future<List<TodoItem>> getItems(ApiToken token, {bool? filterDone});

  /// Updates the "doneAt" property of the item.
  ///
  /// Returns the updated [TodoItem].
  Future<TodoItem> updateItemDone(ApiToken token, int itemId, bool isDone);

  /// Creates a new [TodoItem] and returns its id.
  ///
  /// The [item.id] property is ignored, as the Backend assigns id's to new items.
  Future<int> createItem(ApiToken token, TodoItem item);

  /// Deletes a [TodoItem].
  Future<void> deleteItem(ApiToken token, int itemId);
}
