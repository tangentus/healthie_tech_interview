encryption_config = Rails.application.config.active_record.encryption
key_generator = Rails.application.key_generator

encryption_config.primary_key = key_generator.generate_key("active_record_encryption_primary_key", 32)
encryption_config.deterministic_key = key_generator.generate_key("active_record_encryption_deterministic_key", 32)
encryption_config.key_derivation_salt = key_generator.generate_key("active_record_encryption_key_derivation_salt", 32)
