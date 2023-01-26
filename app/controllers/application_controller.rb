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
    @squared_num = (@num ** 0.5).to_f

    render({ :template => "calculation_templates/sqrt_results.html.erb"})
  end
  
  def blank_payment_form
    render({ :template => "calculation_templates/payment_form.html.erb"})
  end

  def calculate_payment
    @apr = params.fetch("apr").to_f
    @apr_p = @apr.to_s(:percentage, { :precision => 4 })
    @monthly_apr = (@apr/100)/12
    @years = params.fetch("years").to_i * 12
    @principal = params.fetch("principal").to_f
    @principal_c = @principal.to_s(:currency)
    @numerator = (@apr.to_i * @principal.to_i)

    @payment = ((@monthly_apr * @principal) / (1 - (1 + @monthly_apr) ** ((-1) * @years))).to_s(:currency)
    #@principal * ((@montly_apr * (1 + @monthy_apr))/@years) / ((1 + @monthly_apr)*(@years - 1))
    

    render({ :template => "calculation_templates/payment_results.html.erb"})
  end

end
