import 'package:ecogo_mobile_app/data/navigation/destination.dart';

abstract class IDestinationRepository {
  Future getRecentDestinations();
  Future saveRecentDestination(Destination destination);
  Future deleteRecentDestinations();
}
