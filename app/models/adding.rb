class Adding < ApplicationRecord
  belongs_to :diary, optional: true
  belongs_to :keyword, optional: true
end
