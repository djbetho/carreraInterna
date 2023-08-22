class Offer < ApplicationRecord
    has_many :reactions, dependent: :destroy
    has_many :btousers, through: :reactions

    Kinds = %w[postular].freeze

    KindsSpanish = {"postular" => "postular"}.freeze
end
