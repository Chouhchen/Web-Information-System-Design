class BlogController < ApplicationController

  def list
    @pages = Page.find(:all, :order => 'created_at DESC')
  end

  verify :method => :post, :only => [ :create, :update, :remove ],
         :redirect_to => { :action => :list }

  def new
  end

  def create
    @page = Page.new(params[:page])
    if @page.save
      redirect_to :action => :list
    else
      render :action => :new
    end
  end

  def show
    @page = Page.find(params[:id])
  end

  def edit
    @page = Page.find(params[:id])
  end

  def update
    @page = Page.find(params[:id])
    if @page.update_attributes(params[:page])
      redirect_to :action => 'show', :id => @page
    else
      render :action => 'edit'
    end
  end

  def delete
    @page = Page.find(params[:id])
  end

  def remove
    @page = Page.find(params[:id])
    @page.destroy
    redirect_to :action => 'list'
  end

end
