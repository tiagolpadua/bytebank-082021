import 'package:bytebank/models/contact.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<Database> createDatabase() {
  return getDatabasesPath().then((dbPath) {
    final String path = join(dbPath, 'bytebank.db');
    print('createDatabase: $path');
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
  });
}

Future<Database> createDatabase2() async {
  final dbPath = await getDatabasesPath();
  final String path = join(dbPath, 'bytebank.db');
  print('createDatabase: $path');
  final db = await openDatabase(
    path,
    onCreate: (db, version) {
      db.execute('CREATE TABLE contacts('
          'id INTEGER PRIMARY KEY, '
          'name TEXT, '
          'account_number INTEGER)');
    }
  );

  return db;
}

Future<int> save(Contact contact) {
  return createDatabase().then((db) {
    final Map<String, dynamic> contactMap = Map();
    contactMap['id'] = contact.id;
    contactMap['name'] = contact.name;
    contactMap['account_number'] = contact.accountNumber;
    return db.insert('contacts', contactMap);
  });
}

Future<int> save2(Contact contact) async {
  final db = await createDatabase();
  final Map<String, dynamic> contactMap = Map();
  contactMap['id'] = contact.id;
  contactMap['name'] = contact.name;
  contactMap['account_number'] = contact.accountNumber;
  return db.insert('contacts', contactMap);
}

Future<List<Contact>> findAll() {
  return createDatabase().then((db) {
    return db.query('contacts').then((maps) {
      final List<Contact> contacts = [];
      for (Map<String, dynamic> map in maps) {
        final Contact contact = Contact(
          map['id'],
          map['name'],
          map['account_number'],
        );
        contacts.add(contact);
      }
      return contacts;
    });
  });
}

Future<List<Contact>> findAll2() async {
  final db = await createDatabase();
  final maps = await db.query('contacts');
  final List<Contact> contacts = [];
  for (Map<String, dynamic> map in maps) {
    final Contact contact = Contact(
      map['id'],
      map['name'],
      map['account_number'],
    );
    contacts.add(contact);
  }
  return contacts;
}
