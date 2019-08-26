class Document < ApplicationRecord
  belongs_to :family
  belongs_to :user
  belongs_to :folder, optional: true
  has_many :tags, dependent: :destroy
  validates :content, presence: true
  # validates :doc_type, presence: true
  mount_uploader :content, DocumentUploader
end
