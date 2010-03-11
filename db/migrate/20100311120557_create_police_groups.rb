class CreatePoliceGroups < ActiveRecord::Migration
  def self.up
    create_table :police_groups do |t|
      t.integer :discriminatory_behaviour
      t.integer :failures_in_duty
      t.integer :grand_total
      t.integer :incivility
      t.integer :malpractice
      t.string :name
      t.integer :oppressive_behaviour
      t.integer :other
      t.integer :percentage_change
      t.integer :previous_grand_total
      t.integer :traffic_irregularity

      t.timestamps
    end
  end

  def self.down
    drop_table :police_groups
  end
end
