class PuroksController < ApplicationController
  protect_from_forgery except: :edit

  def index
    @purok = Purok.new
    @data = Purok.includes(:residents).order(created_at: :desc).map { |p|  [p.id, p.alias , p.residents.count, p.current_kagawad] }
  end

  def create
    @purok = Purok.new(purok_params)

    if @purok.save
      redirect_to :puroks, notice: 'Purok successfully created!'
    else
      flash[:error] = 'Purok not created.'
    end
  end

  def edit
    respond_to do |format|
      format.js do 
        @purok = Purok.find(params[:id])
      end
    end
  end

  def update
    @purok = Purok.find(params[:id])

    if @purok.update(purok_params)
      redirect_to :puroks, notice: 'Purok successfully update!'
    else
      flash[:error] = 'Purok not updated.'
    end
  end

  def destroy
    @purok = Purok.find(params[:id])
    @purok.destroy()
    redirect_to :puroks, notice: "Purok #{@purok.name} successfully deleted!"
  end

  private
    def purok_params
      params.require(:purok).permit(:id, :name, :num, :current_kagawad)
    end
end
