class Song < ActiveRecord::Base
  # add associations here
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    byebug
    self.artist = Artist.find_or_create_by(name: name)
  end

  def artist_name
    byebug
    self.artist ? self.artist.name : nil
  end

  def song_note_1=(note_text)
     new_note = Note.find_or_create_by(note_text: note_text)
     new_note.song= self
     byebug
  end

  def song_note_1
    byebug
    self.notes ? self.note.note_text : nil
  end
  
  # def new_notes=(new_note_array)
  #   new_note_array.each do |note_text|
  #     #byebug
  #     new_note = Note.create(content: note_text)
  #     new_note.song = self
  #   end
  # end

  # def new_notes
  #   byebug


  # end


  # <p>Notes</p>
  # <p><input name="song[new_notes][]"></p>
  # <p><input name="song[new_notes][]"></p>
  # <p><input name="song[new_notes][]"></p>


end
