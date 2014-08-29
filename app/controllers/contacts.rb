FlexibleApiPadrinoExample::App.controller do
  get '/v1/contacts', provides: [:json] do
    @contacts = Contact.all
    render 'contacts/index'
  end

  get '/v1/contacts', with: :id, provides: [:json] do
    @contact = Contact.find(params[:id])
    render 'contacts/show'
  end
end
