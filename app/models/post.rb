class Post < ApplicationRecord

    has_attached_file :image, styles: { medium: "300x300>", thumb: "100x100>" },default_url: ':style/default.png'
    validates_attachment :image,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
    validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
    belongs_to :user
    has_many :comments
    has_many :likes, as: :likeable,dependent: :destroy

      # validates_uniqueness_of :title, scope: :user_id

      validates :title, presence: true, uniqueness: { scope: :user_id }

    # validates :title,
    # uniqueness: {
    #   # object = person object being validated
    #   # data = { model: "Person", attribute: "Username", value: <username> }
    #   message: ->(object, data) do
    #     "Hey #{object.title}, #{data[:value]} is already taken."
    # end
# }

end
