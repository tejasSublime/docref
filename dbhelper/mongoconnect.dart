import 'package:mongo_dart/mongo_dart.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class MongoConnect {
  Future<Db> connect() async {
    String username = dotenv.env['MONGO_USER_NAME'].toString();
    String password = dotenv.env['MONGO_PASSWORD'].toString();
    var db = await Db.create(
        "mongodb+srv://$username:$password@docrefdb.bxz7qq5.mongodb.net/");
    await db.open();
    return db;
  }
}
