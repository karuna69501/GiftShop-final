class StaticPagesController < ApplicationController
  def homepage
      @products = Product.all
    
  end

  def productCatalog
     @categories = Category.all
  
  end

  def deliveryInfo
  end

  def ContactUs
  end
  
  def adminPanel
    
    if current_user.admin?
   
    else
      redirect_to "/"
    end

    @users = User.all
    @orders = Order.all
    
  end
  
  def assignAdmin
    @user = User.find_by(id: params[:id])  
    @user.update_attribute(:admin, true)
    redirect_to "/admin"
  end
  
  def unassignAdmin
    @user = User.find_by(id: params[:id])  
    @user.update_attribute(:admin, false)
    redirect_to "/admin"
   
  end
  
  def paymentCompleted
    @order = Order.last
    
    @order.update_attribute(:status, "Payment received")
    
    session[:cart]=nil
    session[:activeCart]=nil
    
  end
  
  def category
    cat = params[:title]
    @products = Product.where("category like ?", cat)
    
  end
  
  def Thankyou
    @order=Order.find(params[:id])
    @order.update_attribute(:status,"paid with Paypal")
  end
end
