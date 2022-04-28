class CreateResumes < ActiveRecord::Migration[6.1]
  def change
    create_table :resumes do |t|
      t.integer :user_id
      t.string :name
      t.string :cnic
      t.string :phone_no
      t.string :address
      t.string :cv_pdf

      t.timestamps
    end
  end
end
