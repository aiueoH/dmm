ActiveAdmin.register Item do
  menu priority: 5, label: "物資項目"
  
  permit_params :name, :amount

  index do
    selectable_column
    id_column
    column :name
    column :amount
    column :safety_stock
    column :created_at
    column :updated_at
    actions
  end

  filter :name
  filter :amount
  filter :safety_stock
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Item Details" do
      f.input :name
      f.input :amount
      f.input :safety_stock
    end
    f.actions
  end
  

end
