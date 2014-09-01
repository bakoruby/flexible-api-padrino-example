attributes :name, :address, :city, :state, :zip

if @options[:included_associations].include? :phones
  child :phones do
    extends 'phones/_phone'
  end
end
