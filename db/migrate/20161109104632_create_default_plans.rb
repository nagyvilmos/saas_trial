class CreateDefaultPlans < ActiveRecord::Migration
  def up
      Plan.create name: 'basic', price: 0
      Plan.create name: 'pro', price: 10
  end
  def down
      raise ActiveRecord::IrreversibleMigration, "CanCannot remove basic and pro plan"
  end
end
