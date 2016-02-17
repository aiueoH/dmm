ActiveAdmin.register Receiver do
  menu priority: 6, label: "接收單位"

  permit_params :name, :contact, :phone, :comment

  index do
    selectable_column
    id_column
    column :name
    column :contact
    column :phone
    column :comment
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :contact
  filter :phone
  filter :comment
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Item Details" do
      f.input :name
      f.input :contact
      f.input :phone
      f.input :comment
    end
    f.actions
  end


end
