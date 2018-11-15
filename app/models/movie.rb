class Movie < ApplicationRecord
  include PgSearch
  searchkick
  belongs_to :director

  multisearchable against: [ :title, :syllabus ]







  pg_search_scope :search_by_title_and_syllabus_and_directors,
                  against: [ :title, :syllabus ],
                  associated_against: {
                    director: [ :first_name, :last_name ]
                  },
                  using: {
                    tsearch: { prefix: true } # <-- now `superman batm` will return something!
                  }


end
