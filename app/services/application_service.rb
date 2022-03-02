# frozen_string_literal: true

class ApplicationService

  def self.call(*args)
    service = new(*args)
    service.before
    result = service.call
    service.after
    result
  end

  def before; end

  def call; end

  def after; end

end
