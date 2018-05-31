####url-shortener app
#  owner_id   :integer
#  owner_type :string(20)
#  url        :text(65535)      not null
#  unique_key :string(10)       not null
#  label      :string(255)
#  string     :string(255)
#  use_count  :integer          default(0), not null
#  expires_at :datetime
#  created_at :datetime
#  updated_at :datetime
#  category   :string(255)
#