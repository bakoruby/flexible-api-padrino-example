FlexibleApiPadrinoExample::App.controller do
  get '/v1/contacts', provides: [:json] do
    @options = serializer_includes
    @contacts = Contact.eager_load(sanitized_includes).
      search(search_params).result
    render 'contacts/index'
  end

  get '/v1/contacts', with: :id, provides: [:json] do
    @options = serializer_includes
    @contact = Contact.eager_load(sanitized_includes).find(params[:id])
    render 'contacts/show'
  end

  define_method :serializer_includes do
    sanitized_includes.reduce({included_associations: []}) do |results, include_param|
      results[:included_associations] << include_param
      results
    end
  end

  define_method :sanitized_includes do
    symbolize_includes.inject([]) do |result, include_param|
      result << include_param if Contact.reflect_on_association(include_param)
      result
    end
  end

  define_method :symbolize_includes do
    Array(params[:includes]).collect(&:to_sym)
  end

  define_method :search_params do
    params[:q]
  end

end
