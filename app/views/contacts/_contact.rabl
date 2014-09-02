attributes :name, :address, :city, :state, :zip
node(:href) { |contact| uri url_for(:contact, id: contact.id) }

if @options[:included_associations].include? :phones
  child :phones do
    extends 'phones/_phone'
  end
end
