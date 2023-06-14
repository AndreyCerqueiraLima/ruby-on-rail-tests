SimpleNavigation::Configuration.run do |navigation|
  navigation.items  do |primary|
    primary.item :root, "Home",root_path, class: 'nav-item'
    if current_user.present?
      primary.item :companies, 'Empresas', companies_path, class: 'nav-item', highlights_on: %r(/companies)
      primary.item :dashboard, 'Admin', admin_dashboard_path, class: 'nav-item', highlights_on: %r(admin/dashboard)
      primary.item :users, 'Logout', destroy_user_session_path, class: 'nav-item'
    else
      primary.item :login, 'Login', new_user_session_path, class: 'nav-item'
    end
  end
end