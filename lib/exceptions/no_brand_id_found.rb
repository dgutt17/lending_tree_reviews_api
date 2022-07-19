module Exceptions
  class NoBrandIdFound < StandardError

    def message
      'No Brand Id was found with the received lendingtree.com url.'
    end
  end
end