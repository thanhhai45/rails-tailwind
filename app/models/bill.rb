class Bill < ApplicationRecord
  belongs_to :property

  after_create_commit -> { broadcast_prepend_to "bill_broadcast" }
  after_update_commit -> { broadcast_replace_to "bill_broadcast" }
  after_destroy_commit -> { broadcast_remove_to "bill_broadcast" }
end
