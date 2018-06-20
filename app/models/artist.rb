class Artist < ActiveRecord::Base
    has_many :art_work
    has_secure_password
    
    def slug
        artist.downcase.gsub(" ","-")
    end
    
    def self.find_by_slug(slug)
        Artist.all.find{|artist| artist.slug == slug}
    end
 
end
