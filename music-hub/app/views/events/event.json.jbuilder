#アーティストカレンダー
json.each(@event) do |event|
	json.extract! event, :id, :title
	json.title event.title
	json.start event.start
  	json.end event.end
end
