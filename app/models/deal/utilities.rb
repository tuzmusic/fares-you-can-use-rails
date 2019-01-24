class Deal < ApplicationRecord
  def set_existing_blog_wrapper_for_date
    deal_with_blog_wrapper = Deal.find do |deal|
      deal.id != self.id && 
      deal.posted_date == self.posted_date &&
      deal.blog_head.present? || deal.blog_foot.present?
    end
    self.blog_head = deal_with_blog_wrapper.blog_head
    self.blog_foot = deal_with_blog_wrapper.blog_foot
    self.save
  end
end