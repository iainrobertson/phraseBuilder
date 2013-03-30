class Phrase < ActiveRecord::Base
  attr_accessible :frequency, :lang, :level, :phrase_class, :phrase_text, :pos_id, :properties, :register, :editor_id
  
  belongs_to :author, class_name: "User", foreign_key: :author_id
  belongs_to :editor, class_name: "User", foreign_key: :editor_id

  validates :author_id, presence: true
  #validates :editor_id, presence: true
  validates :phrase_text, presence: true, length: { maximum: 255 }

  default_scope order: 'phrases.created_at DESC'

end
