import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> getDatabase() async {
  final dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    },
    onDowngrade: onDatabaseDowngradeDelete,
    version: 1,
  );
}

Future<int> save(Contact contact) async {
  final db = await getDatabase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;
  return db.insert('contacts', contactMap);
}

Future<List<Contact>> findAll() async {
  final db = await getDatabase();
  final contactMaps = await db.query('contacts');
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
