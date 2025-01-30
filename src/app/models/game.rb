# == Schema Information
#
# Table name: games
#
#  id         :bigint           not null, primary key
#  image_url  :string(255)
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  igdb_id    :bigint
#
class Game < ApplicationRecord
end
