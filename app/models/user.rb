class User < ApplicationRecord
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, email: true

  def self.load_from_file(loader)
    importer.build_params.map do |params|
      user = new(params)
      user.save
    end
  end
end
