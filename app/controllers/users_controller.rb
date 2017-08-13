class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def import
    loader = UserCsvLoader.new csv_data
    User.load_from_file loader
    redirect_to :index
  end

  private

  def csv_data
    csv = params[:csv]
    if csv.respond_to?(:read)
      csv.read
    elsif csv.respond_to?(:path)
      File.read(csv.path)
    end
  end
end
