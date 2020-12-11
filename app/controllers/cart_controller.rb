class CartController < ApplicationController
  before_action :authenticate_user!
  
  def index
  
    # logic to pass the cart data to the view
    if session[:cart] then  #check if the cart exists
      # if the cart does exist the all the items to be displayed on the cart index page are all the items in that cart
      @cart = session[:cart]  
    else
      # if the cart doesnt exist then set the cart to be an empty object
      @cart = {}
    end 
    
  end
  
  def add
    # find the id of the product to be added to the cart
    id = params[:id]
    # find the cart or make a new cart and add product
    # use the cart if it exsists
    if session[:cart] then  
      cart = session[:cart] 
    # make a cart if doesn't exist
    else
      session[:cart] = {} 
      cart = session[:cart] 
    end
  
    # control the product in the cart
    # if the product is already in the cart increase quantity by one
    if cart[id] then 
      cart[id] = cart[id] + 1 
    # if it is not in the cart add one
    else 
      cart[id] = 1   
    end
    redirect_to :action => :index
    
  end
  
  # remove product from cart
  def removeProduct
    id = params[:id]
    cart = session[:cart]
    cart.delete id
    redirect_to :action => :index
    
  end
  
  #remove one item at a time
  def decrease
    id = params[:id]
    cart = session[:cart]
    
    if cart[id] == 1 then
      cart.delete id
    else
      cart[id] = cart[id]-1
    end
    redirect_to :action => :index
    
  end 

  #add one item at a time
  def increase
    id = params[:id]
    cart = session[:cart]
    cart[id] = cart[id]+1
    redirect_to :action => :index
    
  end 

  # clear the cart
  def clearcart
    session[:cart]=nil
    redirect_to :action => :index
  
  end
  
  def createOrder
    
    #Find user details
    @user = User.find(current_user.id)
    
    #Create a new order and link in with the current user
    @order = @user.orders.build(:created_at => DateTime.now, :status => 'In progress')
    @order.save
    
    #Save each product from the cart into the orderproducts table
    @cart = session[:cart] || {} 
    
    @cart.each do | id, quantity |
      product = Product.find_by_id(id)
      
      @orderproduct = @order.orderproducts.build(:product_id => product.id, :title => product.title, :description => product.description, :quantity => quantity, :price => product.price)  
      @orderproduct.save
    end  
    
    @orders = Order.all
   
    # @orderproducts = Orderproduct.all <- To display all orders
    @orderproducts = Orderproduct.where(order_id: Order.last)
    
    
  end
  
  
  #def {methodname} method to be used to stop creating order upon page refresh
    
    #@orderproducts = Orderproduct.where(order_id: Order.limit(1).order(id: :desc).where(user: User.find(current_user.id)))  
  
  #end
  
  
  
  
end
