ActiveAdmin.register Review do
permit_params :content, :user_id, :guide_id, :checked
end
