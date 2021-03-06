class CreateDoorkeeperTables < ActiveRecord::Migration
  def change
    create_table :oauth_applications, options: 'DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci' do |t|
      t.string  :name,         null: false
      t.string  :uid,          null: false
      t.string  :secret,       null: false
      t.text    :redirect_uri, null: false
      t.string  :scopes,       null: false, default: ''
      t.timestamps
    end

    add_index :oauth_applications, :uid, unique: true, name: 'ioa_uid'

    create_table :oauth_access_grants, options: 'DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci' do |t|
      t.integer  :resource_owner_id, null: false
      t.integer  :application_id,    null: false
      t.string   :token,             null: false
      t.integer  :expires_in,        null: false
      t.text     :redirect_uri,      null: false
      t.datetime :created_at,        null: false
      t.datetime :revoked_at
      t.string   :scopes
    end

    add_index :oauth_access_grants, :token, unique: true, name: 'ioa_auid'

    create_table :oauth_access_tokens, options: 'DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci' do |t|
      t.integer  :resource_owner_id
      t.integer  :application_id

      # If you use a custom token generator you may need to change this column
      # from string to text, so that it accepts tokens larger than 255
      # characters. More info on custom token generators in:
      # https://github.com/doorkeeper-gem/doorkeeper/tree/v3.0.0.rc1#custom-access-token-generator
      #
      # t.text     :token,             null: false
      t.string   :token,             null: false

      t.string   :refresh_token
      t.integer  :expires_in
      t.datetime :revoked_at
      t.datetime :created_at,        null: false
      t.string   :scopes
    end

    add_index :oauth_access_tokens, :token, unique: true, name: 'ioat_tn'
    add_index :oauth_access_tokens, :resource_owner_id, name: 'ioatat_ro'
    add_index :oauth_access_tokens, :refresh_token, unique: true, name: 'ioat_rt'
  end
end
