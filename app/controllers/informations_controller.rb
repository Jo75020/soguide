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


def import_guides_xlsx
      if params[:xlsx].nil?
        render :import_guides_xlsx
      else
        filepath = params[:xlsx].path
        xlsx = Roo::Spreadsheet.open(filepath)
        xlsx = Roo::Excelx.new(filepath)
        xlsx.default_sheet = xlsx.sheets.first
        csv = xlsx.to_csv
        csv_options = { col_sep: ',', headers: :first_row, quote_char: '"' }
        csv_new = CSV.new(csv)
        CSV.parse(csv, csv_options) do |row|
        unless row[0].nil?
              check_user = User.find_by(email: row[0].strip.downcase)
              if check_user.nil?
                new_user = User.new(
                email: row[0].strip.downcase,
                password: row[1],
                first_name: row[2],
                last_name: row[3],
                year_of_birth: row[4],
                postal: row[5],
                inscription_reason: row[6],
                facebook_picture_url: row[7])
                new_user.save! unless new_user.email.nil?
               else
                user = User.where(:email => check_user.email).first
                user.update(
                email: row[0].strip.downcase,
                password: row[1],
                first_name: row[2],
                last_name: row[3],
                year_of_birth: row[4],
                postal: row[5],
                inscription_reason: row[6],
                facebook_picture_url: row[7])
                end
                check_user = User.find_by(email: user.email) unless user.nil?
                check_user = User.find_by(email: new_user.email) unless new_user.nil?
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
                user_id: check_user.id )

                unless new_user.nil? == false
                unless (Guide.where(:user_id => (check_user.id) || (user.first.id)).present?)
                  guide.save!
                  else
                  guides = Guide.where(:user_id => check_user.id || (user.first.id))
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
            end
            end
            redirect_to  informations_import_soguide_path, notice: 'Votre fichier à bien été envoyer'
    end
end


def import_reviews_xlsx
  if params[:xlsx].nil?
    render :import_guides_xlsx
  else
    filepath = params[:xlsx].path
    xlsx = Roo::Spreadsheet.open(filepath)
    xlsx = Roo::Excelx.new(filepath)
    xlsx.default_sheet = xlsx.sheets.first
    csv = xlsx.to_csv
    csv_options = { col_sep: ',', headers: :first_row, quote_char: '"' }
    csv_new = CSV.new(csv)
    CSV.parse(csv, csv_options) do |row|
    unless row[0].nil?
      check_user = User.find_by(email: row[0].strip.downcase.delete(' '))
      if check_user.nil?
        new_user = User.new
        new_user.email = row[0].strip.downcase.delete(' ')
        new_user.first_name = row[1]
        new_user.last_name = row[2]
        new_user.password = row[3]
        new_user.save
      else
        check_user = User.find_by(email: row[0].strip.downcase.delete(' '))
        review = Review.new
        review.fake_date = row[4]
        review.content = row[5]
        review.checked = true
        guide_user = User.find_by(email: row[6].strip.downcase.delete(' '))
        unless guide_user.nil?
        guide = Guide.find_by(user_id: guide_user.id)
        review.guide_id = guide.id
        review.user_id = check_user.id
        review.save!
        end
      end
    end
  end
end
redirect_to  informations_import_soguide_path, notice: 'Votre fichier à bien été envoyer'
end

end
