class ProdutosController < ApplicationController

  before_action :set_produto, only:[:edit, :update, :destroy]

  def index
    @produtos = Produto.order(name: :asc).limit 6
    @produto_com_desconto = Produto.order(:price).limit 1
  end

  def new
     @produto = Produto.new
     @departments = Department.all
  end

  def edit  
   renderize :edit
  end

  def update    
    if @produto.update produto_params
      flash[:notice] = "Produto atualizdo com sucesso"
      redirect_to root_url
    else
      renderize :edit
    end
  end

  def create    
    @produto = Produto.new produto_params    
    if @produto.save 
      flash[:notice] = "Produto salvo com sucesso"
      redirect_to root_url
    else
      renderize :new
    end   
  end

  def destroy    
    @produto.destroy
    redirect_to root_url
  end

  def search
    @nome = params[:name]
    @produtos = Produto.where "name like ?", "%#{@nome}%"
  end

private

  def produto_params
    params.require(:produto).permit(:name, :description, :price, :quantity, :department_id) 
  end

  def set_produto
    @produto = Produto.find(params[:id])
  end

  def renderize(view)
    @departments = Department.all
    render view
  end
  
end
