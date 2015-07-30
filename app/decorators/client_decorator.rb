class ClientDecorator < Draper::Decorator
  delegate_all

  def address_ext
    if object.postal_code?
      @city_ext = object.city + " (#{object.postal_code})"
    else
      @city_ext = object.city
    end

    [object.address, @city_ext].reject(&:empty?).join(', ')
  end
end