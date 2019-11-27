class History < ApplicationRecord
    # optional: trueでsign upできるようになる
    belongs_to :user, optional: true
    belongs_to :history
end
