class ProdutosController < ApplicationController

  def index
    @produtos = Produto.order(name: :asc).limit 6
    @produto_com_desconto = Produto.order(:price).limit 1
  end

  def new
     @produto = Produto.new
  end

  def create
    values = params.require(:produto).permit(:name, :description, :price, :quantity) 
    @produto = Produto.new values
    
    if @produto.save 
      flash[:notice] = "Produto salvo com sucesso"
      redirect_to root_url

    else
      render :new
    end

   
  end

  def destroy
    id = params[:id]
    Produto.destroy id
    redirect_to root_url
  end

  def search
    @nome = params[:name]
    @produtos = Produto.where "name like ?", "%#{@nome}%"
  end
  
end
