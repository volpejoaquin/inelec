class ClientDecorator < Draper::Decorator
  delegate_all

  def address_ext
    @address = object.address? ? object.address : ""
    @city = object.city? ? object.city : ""

    @city_ext = object.postal_code? ? @city + " (#{object.postal_code})" : @city

    [@address, @city_ext].reject(&:empty?).join(', ')
  end
end