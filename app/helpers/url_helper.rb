module URLHelper
  def valid_url_param  
    url = params['url']
    if !url.include?('lendingtree.com/reviews/business')
      @error_message = 'Incorrect Base url in url param'
      return false
    end

    name_and_id = url.split('/reviews/business/').last
    name = name_and_id.first
    id = name_and_id.last

    if name !~ /^[a-zA-Z0-9\-]+$/
      @error_message = 'Incorrectly formatted business name'
      return false
    end

    if id !~ /\A\d+\Z/
      @error_message = 'Business Id not present or not an integer'
      return false
    end

    true
  end

  def set_lending_tree_id_and_business_name_from_url
    name_and_id = params['url'].split('/reviews/business/').last
    name_and_id = name_and_id.split('/')

    @lending_tree_id = name_and_id.last
    @business_name = name_and_id.first
  end
end