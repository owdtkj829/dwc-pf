#アーティストカレンダー
json.each(@event) do |event|
	  json.extract! event, :id, :title
	  json.id event.id
	  json.user_id event.user_id
	  json.artist_id event.artist_id
	  json.title event.title
	  json.start event.start
	  json.end event.end
	  json.memo event.memo
	  json.venue event.venue
end
