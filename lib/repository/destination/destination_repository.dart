import 'package:ecogo_mobile_app/data/navigation/destination.dart';
import 'package:ecogo_mobile_app/repository/destination/i_destination_repository.dart';
import 'package:localstore/localstore.dart';

class DestinationRepository extends IDestinationRepository {
  final Localstore _db = Localstore.instance;
  @override
  Future getRecentDestinations() async {
    final items = <String, Destination>{};
    _db.collection('destinations').get().then((value) {
      value?.entries.forEach((element) {
        final item = Destination.fromMap(element.value);
        items.putIfAbsent(item.id, () => item);
      });
    });
    return items;
  }

  @override
  Future saveRecentDestination(Destination destination) async {
    var result = await _db
        .collection("destinations")
        .doc(destination.id)
        .set(destination.toMap());
  }

  @override
  Future deleteRecentDestinations() async {
    _db.collection('destinations').get().then((value) {
      value?.entries.forEach((element) {
        final item = Destination.fromMap(element.value);
        _db.collection('destinations').doc(item.id).delete();
      });
    });
  }
}
