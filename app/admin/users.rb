ActiveAdmin.register User do
    permit_params :first_name, :last_name, :email, :photo, :photo_cache, :year_of_birth, :postal, :admin, :password, :password_confirmation
    index do
    selectable_column
    column :first_name
    column :last_name
    column :email
    column :admin
    column :created_at
    actions
  end

    form do |f|
    f.inputs "Identity" do
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :password
      f.input :password_confirmation
      f.input :photo
      f.input :admin
    end
    f.actions
  end

end
