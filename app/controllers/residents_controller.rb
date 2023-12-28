class ResidentsController < ApplicationController
  def index
    @data = Resident.joins(:purok).order(created_at: :desc).map { |r|  [r.id, r.full_name, r.birthdate.to_date, r.contact_no, r.purok.alias] }
  end

  def new
    @resident = Resident.new
    @purok_options = Purok.order(created_at: :desc).map { |p|  ["#{p.num} - #{p.name.titleize}", p.id] }
  end

  def create
    @resident = Resident.new(resident_params)

    if @resident.save
      redirect_to :residents, notice: 'Resident successfully created!'
    else
      flash[:error] = 'Resident not created.'
    end
  end

  def edit
    @resident = Resident.find(params[:id])
    @purok_options = Purok.order(created_at: :desc).map { |p|  ["#{p.num} - #{p.name.titleize}", p.id] }
  end

  def update
    @resident = Resident.find(params[:id])

    if @resident.update(resident_params)
      redirect_to :residents, notice: 'Resident successfully update!'
    else
      flash[:error] = 'Resident not updated.'
    end
  end

  def destroy
    @resident = Resident.find(params[:id])
    @resident.destroy()
    redirect_to :residents, notice: "Resident #{@resident.full_name} successfully deleted!"
  end

  private
    def resident_params
      params.require(:resident).permit(:id, :first_name, :last_name, :middle_name, :birthdate, :contact_no, :purok_id)
    end
end
