SimpleNavigation::Configuration.run do |navigation|
  navigation.items  do |primary|
    primary.item :root, "Home",root_path, class: 'nav-item'
    if current_user.present?
      primary.item :companies, 'Empresas', companies_path, class: 'nav-item' do |second|
        second.item :users, 'Usuarios', new_company_user_path,class: 'nav-item'
      end
      second.item :users, 'Logout', destroy_user_session_path,class: 'nav-item'
    else
      primary.item :login, 'Login', new_user_session_path, class: 'nav-item'
      primary.item :registration, 'Cadastro', new_user_registration_path, class: 'nav-item'
    end
  end
end