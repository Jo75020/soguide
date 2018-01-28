ActiveAdmin.register Guide do
    permit_params :first_name, :last_name, :email, :mobile_phone, :phone, :regions, :guide_type, :experience, :structure, :structure_website, :license, :language, :soguide_description, :main_review, :soguide_url, :pays, :user_id, :language_second, :guide_type_second, :language_third, :language_fourth, :language_fifth, :guide_type_third







  index do
    selectable_column
    column("Prénom"){|u| u.user.first_name }
    column("Nom"){|u| u.user.last_name }
    column("Email"){|u| u.user.email }
    column("Avis Client"){|u| u.reviews.length }
    column :mobile_phone
    column :pays
    column("Date de création"){|u| u.created_at }
    actions
  end

      form do |f|
    f.inputs "Identity" do
      f.input :user
      f.input :mobile_phone
      f.input :phone
      f.input :regions
      f.input :guide_type
      f.input :guide_type_second
      f.input :guide_type_third
      f.input :experience
      f.input :structure
      f.input :structure_website
      f.input :license
      f.input :language
      f.input :language_second
      f.input :language_third
      f.input :language_fourth
      f.input :language_fifth
      f.input :soguide_description
      f.input :soguide_url
      f.input :main_review
      f.input :pays
    end
    f.actions
  end
end
