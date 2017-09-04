ActiveAdmin.register Country do
    permit_params :name, :description, :photo, :photo_cache, :address, :full_description, :best_period, :country, :latitude, :longitude

  index do
    selectable_column
    column :name
    column :description
    column :created_at
    actions
  end

      form do |f|
    f.inputs "Identity" do
      f.input :name
      f.input :address
      f.input :photo
      f.input :description
      f.input :full_description
      f.input :best_period
    end
    f.actions
  end
end