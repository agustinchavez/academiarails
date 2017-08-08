class Post < ActiveRecord::Base
  acts_as_taggable

  has_many :taggings
  has_many :tags, through: :taggings

  extend FriendlyId
  friendly_id :title, use: :slugged

  belongs_to :author

  POR_PAGINA = 5

  scope :most_recent, -> {order(published_at: :asc)}
  scope :published, -> {where(published: true)}
  scope :recent_paginated, -> (page) {most_recent.paginate(page: page, per_page: POR_PAGINA)}
  scope :with_tag, -> (tag) {tagged_with(tag) if tag.present? }

  scope :list_for, -> (page, tag) do
    recent_paginated(page).with_tag(tag)
  end

  def should_generate_new_friendly_id?
    title_changed?
  end

  def display_day_published
    if published_at.present?
      "Published #{published_at.strftime('%-b %-d, %Y')}"
    else
      "Not pub yet."
    end
  end

  def publish
    update(published: true, published_at: Time.now)
  end

  def unpublish
    update(published: false, published_at: nil)
  end

  def tag_list
    tags.join(", ")
  end

  def tag_list=(tags_string)
    tag_names = tags_string.split(",").collect{|s| s.strip.downcase}.uniq
    new_or_found_tags = tag_names.collect { |name| Tag.find_or_create_by(name: name) }
    self.tags = new_or_found_tags
  end

end
