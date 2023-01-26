class ApplicationController < ActionController::Base

  def blank_square_form
    render({ :template => "calculation_templates/square_form.html.erb"})
  end

  def calculate_square
    # params = {"elephant" => "42"}

    @num = params.fetch("elephant").to_f
    @square_of_num = @num * @num

    render({ :template => "calculation_templates/square_results.html.erb"})
  end

  def blank_sqrt_form
    render({ :template => "calculation_templates/sqrt_form.html.erb"})
  end

  def calculate_sqrt
    
    @num = params.fetch("dog").to_f
    @squared_num = (@num ** 0.5).to_i

    render({ :template => "calculation_templates/sqrt_results.html.erb"})
  end

end
