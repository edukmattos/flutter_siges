const String docAllMaterials = '''
  subscription getMaterials {
    materials {
      id
      code
      description
      material_unit_id
      material_unit {
        id
        code
        description
      }
      created_at
      updated_at
      deleted_at
    }
  }
''';