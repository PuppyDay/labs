class XmlController < ApplicationController
  def index
    v1 = params[:v1].to_i
    @result = (rooting(v1) if v1.to_s =~ /^[-+]?[0-9]*\.?[0-9]+$/ && v1.positive?)
    @steps = [-1.0] if @result.nil?
    respond_to do |format|
      format.xml { render xml: @steps.to_xml }
      format.rss { render xml: @steps.to_xml }
    end
  end

  def rooting(a_argument)
    x_current = a_argument
    res = 0
    @steps = []
    loop do
      x_current = 0.5 * (x_current + a_argument / x_current)
      res = x_current
      @steps << res
      break if (x_current**2 - a_argument) / a_argument < 0.001
    end
    res
  end
  end
