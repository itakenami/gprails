class CustomValidator < ActiveModel::EachValidator
  def validate_each(object, attribute, value)
      if value.length < options[:tamanho]+1
        object.errors[attribute] << (options[:message] || "Campo muito curto")
      end

  end
end