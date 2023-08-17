SimpleNavigation::Configuration.run do |navigation|
  navigation.items  do |primary|
    primary.item :root, "Home",root_path, class: 'nav-item'
    if current_user.present?

      primary.item :companies, 'Empresas', companies_path, class: 'nav-item', highlights_on: %r(/companies) do |p|
        p.item :users, 'Usuários', companies_path, class: 'nav-item', highlights_on: %r(/products)
        p.item :products, 'Produtos', companies_path, class: 'nav-item', highlights_on: %r(/users)
      end

      primary.item :dashboard, 'Admin', admin_dashboard_path, class: 'nav-item', highlights_on: %r(admin/dashboard)
      primary.item :users, 'Logout', destroy_user_session_path, class: 'nav-item'
    else
      primary.item :login, 'Login', new_user_session_path, class: 'nav-item'
    end
  end
end