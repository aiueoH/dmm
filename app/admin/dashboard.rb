ActiveAdmin.register_page "Dashboard" do

  menu priority: 1#, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ "Dashboard" } do
    
    columns do
      column do
        panel "近 5 位管理員" do
          table_for User.order('created_at desc').limit(5) do
            column("帳號(e-mail)")  {|user| link_to(user.email, admin_users_path)  }
            column("名稱")      {|user| user.name                           }
            column("建立時間")  {|user| user.created_at                       }
          end
          strong{ link_to "查看更多", admin_users_path } if User.count>5
        end
      end
      column do
      end
      column do
      end
    end
    
    columns do
      column do
        panel "近 10 筆物資項目" do
          table_for Item.order('created_at desc').limit(10) do
            column("物資名稱")  {|item| link_to(item.name, admin_items_path)  }
            column("數量")      {|item| item.amount                           }
            column("安全數量")  {|item| item.safety_stock                     }
            column("建立時間")  {|item| item.created_at                       }
          end
          strong{ link_to "查看更多", admin_items_path } if Item.count>10
        end
      end
      
      column do
        panel "近 10 筆接收單位" do
          table_for Receiver.order('created_at desc').limit(10) do
            column("接收單位")  {|receiver| link_to(receiver.name, admin_receivers_path)  }
            column("聯絡人")      {|receiver| receiver.contact                           }
            column("聯絡電話")      {|receiver| receiver.phone                           }
            column("備註")      {|receiver| receiver.comment                           }
            column("建立時間")  {|receiver| receiver.created_at                       }
          end
          strong{ link_to "查看更多", admin_receivers_path } if Receiver.count>10
        end
      end
      
      column do
      end
    end
    
    columns do
      column do
        panel "近 10 筆分配資訊" do
          table_for Order.order('created_at desc').limit(10) do
            column("接收單位")      {|order| order.receiver.name                           }
            column("物資名稱")  {|order| order.item.name  }
            column("分配數量")  {|order| order.amount  }
            column("備註")  {|order| link_to(order.comment, admin_orders_path)  }
            column("建立時間")  {|order| order.created_at                       }
          end
          strong{ link_to "查看更多", admin_orders_path } if Order.count>10
        end
      end
    end
      
  end # content
end
