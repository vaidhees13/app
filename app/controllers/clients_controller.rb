class ClientsController < ApplicationController
  def index
    @client = Client.all
    @client = Client.search(params[:search])

  end



  def show
    @client = Client.find(params[:id])
    redirect_to :action => "index"
  end

  def new
    @client=Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to :action => "index"
    else
      render 'new'
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update_attributes(client_params)
      redirect_to @client
    else
      render 'edit'
    end

  end

  def destroy
    @client = Client.find(params[:id])
    @client.destroy
    redirect_to @client
  end

  private
  def client_params
    params.require(:client).permit(:name,:site)

  end

end
