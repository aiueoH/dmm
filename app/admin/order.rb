ActiveAdmin.register Order do
  menu priority: 7, label: "分配資料"
  
  permit_params :receiver_id, :item_id, :amount, :comment

  index do
    selectable_column
    id_column
    column :receiver_id
    column :item_id
    column :amount
    column :comment
    column :created_at
    column :updated_at
    actions
  end

  filter :receiver_id
  filter :item_id
  filter :amount
  filter :comment
  filter :updated_at
  filter :created_at

  form do |f|
    f.inputs "Item Details" do
      f.input :receiver_id
      f.input :item_id
      f.input :amount
      f.input :comment
    end
    f.actions
  end


end
