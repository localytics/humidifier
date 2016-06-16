module Humidifier

  # Dumps an object to CFN syntax
  class Serializer

    class << self
      # dumps the given object out to CFN syntax recursively
      def dump(node)
        case node
        when Hash then node.map { |key, value| [key, dump(value)] }.to_h
        when Array then node.map { |value| dump(value) }
        when Ref, Fn then dump(node.to_cf)
        else node
        end
      end
    end
  end
end
