require 'csv'
require 'roo'

class InformationsController < ApplicationController
before_filter :authorize_admin

  def download_csv
      csv_path = File.join(Rails.root, 'public')
      send_file(
          File.join(csv_path, 'SoGuide-import-guides.csv'),
          filename: 'SoGuide-import-guides.csv',
          type: 'text/csv'
      )
  end

  def download_xlsx
      xlsx_path = File.join(Rails.root, 'public')
      send_file(
          File.join(xlsx_path, 'SoGuide-import-guides.xlsx'),
          filename: 'SoGuide-import-guides.xlsx',
          type: 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
      )
  end


    def import_csv
      if params[:file].nil?
        render :import_guides
      else
        headers_true = ["email","password","prenom","nom","annee de naissance","code postal","raison dinscription","photo","numero mobile","numero fixe","regions","type de guide","experience","structure","site web","license","langues","description","main review","url","pays", "email secondaire", "pays 2", "facebook_profil_url", "facebook_profil_page", "genre"]
        csv_options = { col_sep: ',', headers: :first_row }
        filepath = params[:file].path
        headers = CSV.read(filepath, headers: true).headers
        if headers == headers_true
            CSV.foreach(filepath, csv_options) do |row|
                user = User.new(email: row[0], password: row[1], first_name: row[2], last_name: row[3], year_of_birth: row[4], postal: row[5], inscription_reason: row[6], facebook_picture_url: row[7])
                user.save!
                guide = Guide.new(mobile_phone: row[8], phone: row[9], regions: row[10], guide_type: row[11], experience: row[12], structure: row[13], structure_website: row[14], license: row[15], language: row[16], soguide_description: row[17], main_review: row[18], soguide_url: row[19], pays: row[20], secondary_email: row[21], pays_2: row[22], facebook_profil_url: row[23], facebook_profil_page: row[24], gender: row[25], user_id: user.id )
                guide.save!
            end
            redirect_to  informations_import_guides_path, notice: 'Votre fichier à bien été envoyer'
        else
            redirect_to informations_import_guides_path, alert: 'Votre fichier est incorrect, merci de le corriger et le renvoyer'
        end
       end
  end # def


    def import_xlsx
      if params[:xlsx].nil?
        render :import_loc
      else
        filepath = params[:xlsx].path
        xlsx = Roo::Spreadsheet.open(filepath)
        xlsx = Roo::Excelx.new(filepath)
        xlsx.default_sheet = xlsx.sheets.first
        csv = xlsx.to_csv
        csv_options = { col_sep: ',', headers: :first_row, quote_char: '"' }
        csv_new = CSV.new(csv)
        CSV.parse(csv, csv_options) do |row|
               new_user = User.new(
                email: row[0],
                password: row[1],
                first_name: row[2],
                last_name: row[3],
                year_of_birth: row[4],
                postal: row[5],
                inscription_reason: row[6],
                facebook_picture_url: row[7])
               unless (User.where(:email => new_user.email).present?)
                new_user.save!
               else
                user = User.where(:email => new_user.email)
                user.update(
                email: row[0],
                password: row[1],
                first_name: row[2],
                last_name: row[3],
                year_of_birth: row[4],
                postal: row[5],
                inscription_reason: row[6],
                facebook_picture_url: row[7])
                end
                guide = Guide.new(
                mobile_phone: row[8],
                phone: row[9],
                regions: row[10],
                guide_type: row[11],
                experience: row[12],
                structure: row[13],
                structure_website: row[14],
                license: row[15],
                language: row[16],
                soguide_description: row[17],
                main_review: row[18],
                soguide_url: row[19],
                pays: row[20],
                secondary_email: row[21],
                pays_2: row[22],
                facebook_profil_url: row[23],
                facebook_profil_page: row[24],
                gender: row[25],
                language_second: row[26],
                guide_type_second: row[27],
                language_third: row[28],
                language_fourth: row[29],
                language_fifth: row[30],
                guide_type_third: row[31],
                partners: row[32],
                user_id: new_user.id )


                unless (Guide.where(:user_id => (new_user.id) || (user.first.id)).present?)
                  guide.save!
                  else
                  guides = Guide.where(:user_id => new_user.id || (user.first.id))
                  guide = guides.first
                  guide.update(
                  mobile_phone: row[8],
                  phone: row[9],
                  regions: row[10],
                  guide_type: row[11],
                  experience: row[12],
                  structure: row[13],
                  structure_website: row[14],
                  license: row[15],
                  language: row[16],
                  soguide_description: row[17],
                  main_review: row[18],
                  soguide_url: row[19],
                  pays: row[20],
                  secondary_email: row[21],
                  pays_2: row[22],
                  facebook_profil_url: row[23],
                  facebook_profil_page: row[24],
                  gender: row[25],
                  language_second: row[26],
                  guide_type_second: row[27],
                  language_third: row[28],
                  language_fourth: row[29],
                  guide_type_third: row[30],
                  partners: row[31],)
                end
            end
            redirect_to  informations_import_guides_path, notice: 'Votre fichier à bien été envoyer'
    end
  end
end
