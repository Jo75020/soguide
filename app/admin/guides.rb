ActiveAdmin.register Guide do
    permit_params :first_name, :last_name, :email, :mobile_phone, :phone, :regions, :guide_type, :experience, :structure, :structure_website, :license, :language, :soguide_description, :main_review, :soguide_url, :pays, :user_id

  index do
    selectable_column
    column :first_name
    column :last_name
    column :email
    column :mobile_phone
    column :pays
    column :created_at
    actions
  end

      form do |f|
    f.inputs "Identity" do
      f.input :user
      f.input :first_name
      f.input :last_name
      f.input :email
      f.input :mobile_phone
      f.input :phone
      f.input :regions
      f.input :guide_type
      f.input :experience
      f.input :structure
      f.input :structure_website
      f.input :license
      f.input :language
      f.input :soguide_description
      f.input :soguide_url
      f.input :main_review
      f.input :pays
    end
    f.actions
  end
end
