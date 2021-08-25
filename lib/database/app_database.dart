import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class ContactDao {
  static const tableSql = 'CREATE TABLE $_tableName('
      '$_id INTEGER PRIMARY KEY, '
      '$_name TEXT, '
      '$_accountNumber INTEGER)';

  static const String _tableName = 'contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'account_number';

  Future<Database> getDatabase() async {
    final dbPath = await getDatabasesPath();
    final String path = join(dbPath, 'bytebank.db');
    return openDatabase(
      path,
      onCreate: (db, version) {
        db.execute(tableSql);
      },
      onDowngrade: onDatabaseDowngradeDelete,
      version: 1,
    );
  }

  Future<int> save(Contact contact) async {
    final db = await getDatabase();
    Map<String, dynamic> contactMap = _toMap(contact);
    return db.insert('contacts', contactMap);
  }

  Map<String, dynamic> _toMap(Contact contact) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return contactMap;
  }

  Future<List<Contact>> findAll() async {
    final db = await getDatabase();
    final contactMaps = await db.query('contacts');
    List<Contact> contacts = _toList(contactMaps);
    return contacts;
  }

  List<Contact> _toList(List<Map<String, Object?>> contactMaps) {
     final List<Contact> contacts = [];
    for (Map<String, dynamic> contactMap in contactMaps) {
      final Contact contact = Contact(
        contactMap['id'],
        contactMap['name'],
        contactMap['account_number'],
      );
      contacts.add(contact);
    }
    return contacts;
  }
}
