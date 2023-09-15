class AddDepartmentIdToProduto < ActiveRecord::Migration[7.0]
  def change
    add_column :produtos, :department_id, :integer
  end
end
