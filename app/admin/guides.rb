ActiveAdmin.register Guide do
    permit_params :first_name, :last_name, :email, :mobile_phone, :phone, :regions, :guide_type, :experience, :structure, :structure_website, :license, :language, :soguide_description, :main_review, :soguide_url, :pays

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
end
