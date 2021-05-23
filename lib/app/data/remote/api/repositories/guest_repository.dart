import 'package:suitmedia/app/data/remote/api/api_provider.dart';
import 'package:suitmedia/app/data/remote/models/list_guest_response.dart';

class GuestRepository {
  final ApiProvider _apiProvider = ApiProvider();

  Future<ListGuestResponse> getGuest(int page) async {
    final users = await _apiProvider.getReqRes('/users?page=$page&per_page=10');
    if (users.status.hasError) {
      return Future.error(users.statusText ?? "Terjadi Kesalahan");
    } else{
      return ListGuestResponse.fromJson(users.body);
    }
  }
}
