FlexibleApiPadrinoExample::Admin.controllers :phones do
  get :index do
    @title = "Phones"
    @phones = Phone.all
    render 'phones/index'
  end

  get :new do
    @title = pat(:new_title, :model => 'phone')
    @phone = Phone.new
    render 'phones/new'
  end

  post :create do
    @phone = Phone.new(params[:phone])
    if @phone.save
      @title = pat(:create_title, :model => "phone #{@phone.id}")
      flash[:success] = pat(:create_success, :model => 'Phone')
      params[:save_and_continue] ? redirect(url(:phones, :index)) : redirect(url(:phones, :edit, :id => @phone.id))
    else
      @title = pat(:create_title, :model => 'phone')
      flash.now[:error] = pat(:create_error, :model => 'phone')
      render 'phones/new'
    end
  end

  get :edit, :with => :id do
    @title = pat(:edit_title, :model => "phone #{params[:id]}")
    @phone = Phone.find(params[:id])
    if @phone
      render 'phones/edit'
    else
      flash[:warning] = pat(:create_error, :model => 'phone', :id => "#{params[:id]}")
      halt 404
    end
  end

  put :update, :with => :id do
    @title = pat(:update_title, :model => "phone #{params[:id]}")
    @phone = Phone.find(params[:id])
    if @phone
      if @phone.update_attributes(params[:phone])
        flash[:success] = pat(:update_success, :model => 'Phone', :id =>  "#{params[:id]}")
        params[:save_and_continue] ?
          redirect(url(:phones, :index)) :
          redirect(url(:phones, :edit, :id => @phone.id))
      else
        flash.now[:error] = pat(:update_error, :model => 'phone')
        render 'phones/edit'
      end
    else
      flash[:warning] = pat(:update_warning, :model => 'phone', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy, :with => :id do
    @title = "Phones"
    phone = Phone.find(params[:id])
    if phone
      if phone.destroy
        flash[:success] = pat(:delete_success, :model => 'Phone', :id => "#{params[:id]}")
      else
        flash[:error] = pat(:delete_error, :model => 'phone')
      end
      redirect url(:phones, :index)
    else
      flash[:warning] = pat(:delete_warning, :model => 'phone', :id => "#{params[:id]}")
      halt 404
    end
  end

  delete :destroy_many do
    @title = "Phones"
    unless params[:phone_ids]
      flash[:error] = pat(:destroy_many_error, :model => 'phone')
      redirect(url(:phones, :index))
    end
    ids = params[:phone_ids].split(',').map(&:strip)
    phones = Phone.find(ids)
    
    if Phone.destroy phones
    
      flash[:success] = pat(:destroy_many_success, :model => 'Phones', :ids => "#{ids.to_sentence}")
    end
    redirect url(:phones, :index)
  end
end
