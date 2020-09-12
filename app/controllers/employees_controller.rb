class EmployeesController < ApplicationController
  def index
    @employees = Employee.all
  end

  def show
    @employee = Employee.find params[:id]
  end

  def new
    @employee = Employee.new
  end

  def edit
    @employee = Employee.find params[:id]
  end

  def create
    @employee = Employee.new employee_params

    if @employee.save
      flash[:notice] = 'Funcionário criado com sucesso!'
      redirect_to employees_path
    else
      render :new
    end
  end

  def update
    @employee = Employee.find params[:id]
    
    if @employee.update employee_params
      flash[:notice] = 'Funcionário atualizado com sucesso!'
      redirect_to employees_path
    else
      render :edit
    end
  end

  def destroy
    @employee = Employee.find params[:id]
    @employee.destroy
    flash[:notice] = 'Funcionário excluído com sucesso!'
    redirect_to employees_path
  end

  private

  def employee_params
    params.require(:employee).permit :name, :phone, :office
  end
end
