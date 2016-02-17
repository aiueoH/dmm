ActiveAdmin.register User do
  menu priority: 4, label: "物資管理員"
  
  permit_params :email, :name, :password

  index do
    selectable_column
    id_column
    column :email
    column :name
    column :current_sign_in_at
    column :sign_in_count
    column :created_at
    actions
  end

  filter :email
  filter :name
  filter :current_sign_in_at
  filter :sign_in_count
  filter :created_at

  form do |f|
    f.inputs "User Details" do
      f.input :email
      f.input :name
      f.input :password
    end
    f.actions
  end

end
