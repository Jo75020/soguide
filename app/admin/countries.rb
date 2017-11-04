ActiveAdmin.register Country do
    permit_params :name, :description, :address, :full_description, :best_period, :country, :best_moment_picture, photos: []


  index do
    selectable_column
    column :name
    column :description
    column :created_at
    actions
  end

      form :html => { :multipart => true } do |f|
      f.inputs "Identity" do
      f.input :name
      f.input :photos, as: :formtastic_attachinary
      f.input :best_moment_picture
      f.input :description
      f.input :full_description
      f.input :best_period
    end
    f.actions
  end
end
