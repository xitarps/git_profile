# frozen_string_literal: true

# Concern to provide search method
module Searchable
  extend ActiveSupport::Concern

  class_methods do
    def find_with_any_column(arg)
      where(build_query(arg))
    end

    private

    def filtered_attributes
      (column_names.to_a - %w[id member_id platform avatar created_at updated_at]).map(&:to_sym)
    end

    def build_query(arg)
      filtered_attributes.map { |attr| "#{attr} ILIKE '%#{arg}%'" }.join(') OR (')
    end
  end
end
