class PagesController < ApplicationController
  def home
    @site_class = params[:site_class] == nil ? 'all' : params[:site_class]

    @sites = SITES.map do |site|
      [
        site.first,
        site.second,
        site.second.camelize.constantize.where(status: 'BEFORE'),
        site.second.camelize.constantize.where(status: 'CODING'),
        LastUpdate.where(site: site.second).first.date
      ]
    end
  end

  def browser_extensions
  end

  def api
  end

  def about
    @join = Join.new
  end
end
