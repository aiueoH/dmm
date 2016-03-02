class Receiver < ActiveRecord::Base
    has_many :orders
    
    validates_presence_of   :name, message: "請務必填入接收單位名稱。"
    validates_uniqueness_of :name, message: "此名稱已被使用。"
end
