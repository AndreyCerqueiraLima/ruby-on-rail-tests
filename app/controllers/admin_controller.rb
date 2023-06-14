class AdminController < ApplicationController

  def company_dashboard
    @companies = Company.select("strftime('%m/%Y', created_at) AS month, COUNT(*) AS count").group("month")
    @months = []
    @companies_per_month = []
    @companies.each do |company_dashboard|
      @months << company_dashboard.month
      @companies_per_month << company_dashboard.count
    end
  end

  def user_dashboard
    @users = User.select("strftime('%m/%Y', created_at) AS month, COUNT(*) AS count").group("month")
    @months = []
    @users_per_month = []
    @users.each do |company_dashboard|
      @months << company_dashboard.month
      @users_per_month << company_dashboard.count
    end
  end

  def dashboard

  end

end