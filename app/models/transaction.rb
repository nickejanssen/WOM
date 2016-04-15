class Transaction < ActiveRecord::Base
	validates :name, :presence => true, 
                    :length => {:minimum => 3, :maximum => 254}
    validates :amount, :presence => true, :numericality =>  {:greater_than => 1}, :format => { :with => /\A\d+(?:\.\d{0,2})?\z/ }
end
