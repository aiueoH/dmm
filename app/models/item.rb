class Item < ActiveRecord::Base
    has_many :orders
end
