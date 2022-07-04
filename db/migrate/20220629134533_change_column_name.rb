class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :saisons, :numero, :numeroSaison
  end
end
