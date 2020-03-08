const String docAllClients = '''
  subscription getClients {
    clients {
      id
      ein_ssa
      name
      email
    }
  }
''';